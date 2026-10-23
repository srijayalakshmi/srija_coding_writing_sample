library(data.table)
library(ggplot2)
library(scales)

panel_path <- "Panels/Analysis_Panel.csv"
out_dir    <- "Analysis/Data_Trend_Analysis"
if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)

df <- fread(normalizePath(panel_path))

explanatory_vars <- c("INF_CPI", "WPI_INPUT", "IIP_INDUSTRY", "CREDIT_INDUSTRY")

var_labels <- c(
  INF_CPI         = "CPI Inflation (%)",
  WPI_INPUT       = "WPI Input Cost Inflation (%)",
  IIP_INDUSTRY    = "Industry-matched IIP (Index)",
  CREDIT_INDUSTRY = "Industry-matched Credit Growth (%)"
)

# 1. Collapse to wave-level means
wave_df <- df[, lapply(.SD, mean, na.rm = TRUE),
              by = .(WAVE_NO), .SDcols = explanatory_vars]
setorder(wave_df, WAVE_NO)

# 2. Reshape long
trend_long <- melt(wave_df, id.vars = "WAVE_NO",
                   measure.vars = explanatory_vars,
                   variable.name = "Variable", value.name = "Value")

# 3. Z-score standardize within each variable (this is what makes the
#    single combined plot legible — comment out to see why it's needed)
trend_long[, Z_Value := (Value - mean(Value, na.rm = TRUE)) / sd(Value, na.rm = TRUE),
           by = Variable]

trend_long[, Variable := factor(var_labels[as.character(Variable)],
                                levels = var_labels)]

# ---- CLEANED-UP wave-date axis formatter -----------------------------
# Change from before:
#   - breaks now step by 2 waves (~semi-annual) instead of every single
#     wave, so labels aren't packed shoulder-to-shoulder
#   - label collapsed to one line ("Jan–Apr 2022") instead of two
#     ("Jan–Apr\n2022"), since the two-line + angled combination was what
#     was causing the visual overlap
#   - paired with axis.text.x angle/hjust in the theme below
WAVE_NO_scale <- scale_x_continuous(
  breaks = function(x) seq(floor(min(x, na.rm = TRUE)), ceiling(max(x, na.rm = TRUE)), by = 2),
  labels = function(x) {
    yr  <- 2022 + (x - 25) %/% 3
    per <- ((x - 25) %% 3) + 1
    lbls <- c("Jan–Apr", "May–Aug", "Sep–Dec")
    paste0(lbls[per], " ", yr)
  },
  expand = expansion(mult = c(0.03, 0.05))
)

my_theme <- theme_minimal(base_size = 12) +
  theme(
    plot.title       = element_text(face = "bold", size = 14, margin = margin(b = 8)),
    plot.subtitle    = element_text(face = "italic", size = 10, color = "grey30", margin = margin(b = 12)),
    plot.caption     = element_text(size = 9, color = "grey40", hjust = 1, margin = margin(t = 8)),
    axis.text.x      = element_text(size = 8, angle = 40, hjust = 1, vjust = 1),
    axis.title.x     = element_text(margin = margin(t = 10)),
    legend.position  = "bottom",
    legend.title     = element_blank(),
    panel.grid.minor = element_blank()
  )

# PLOT A: All four variables overlaid, standardized (the "single graph")
p_combined <- ggplot(trend_long, aes(x = WAVE_NO, y = Z_Value,
                                     colour = Variable, group = Variable)) +
  geom_hline(yintercept = 0, linetype = "dashed", colour = "grey60") +
  geom_line(linewidth = 1.1, na.rm = TRUE) +
  geom_point(size = 2.2, na.rm = TRUE) +
  WAVE_NO_scale +
  scale_colour_manual(values = c("#E63946", "#457B9D", "#2A9D8F", "#E9C46A")) +
  labs(
    title    = "Trends in Core Explanatory Variables Across Survey Waves",
    subtitle = "Standardized (z-score) values — comparable scale, not raw units",
    x        = "Wave Date",
    y        = "Standardized Value (SD from mean)",
    caption  = "Source: CMIE CPHS, CMIE Industry Outlook. Series z-scored within variable."
  ) +
  my_theme

ggsave(file.path(out_dir, "Fig_Combined_Explanatory_Trends.png"),
       p_combined, width = 11, height = 6.5, dpi = 200, bg = "white")

# PLOT B: Same variables, raw values, faceted — sanity check on actual
# levels/magnitudes without the standardization distortion
p_facet <- ggplot(trend_long, aes(x = WAVE_NO, y = Value, colour = Variable)) +
  geom_line(linewidth = 1, na.rm = TRUE) +
  geom_point(size = 1.8, na.rm = TRUE) +
  facet_wrap(~ Variable, scales = "free_y", ncol = 2) +
  WAVE_NO_scale +
  scale_colour_manual(values = c("#E63946", "#457B9D", "#2A9D8F", "#E9C46A")) +
  labs(
    title    = "Core Explanatory Variables — Raw Values by Wave",
    subtitle = "Each panel on its own scale (for reference alongside the standardized overlay)",
    x        = "Wave Date",
    y        = NULL,
    caption  = "Source: CMIE CPHS, CMIE Industry Outlook"
  ) +
  my_theme +
  theme(legend.position = "none",
        axis.text.x = element_text(size = 7, angle = 40, hjust = 1, vjust = 1))

ggsave(file.path(out_dir, "Fig_Explanatory_Trends_Facets.png"),
       p_facet, width = 11, height = 7.5, dpi = 200, bg = "white")
