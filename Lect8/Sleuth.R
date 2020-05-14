setwd('~/data')
library("sleuth")
s2c <- read.csv(file.path("sample.tsv"),
                  header = TRUE,
                  stringsAsFactors = FALSE)
gene <-read.csv(file.path("gene_transcript.txt"))
ttg <- dplyr::select(gene,c("target_id","gene"))
so <- sleuth_prep(s2c, extra_bootstrap_summary = TRUE, target_mapping=ttg,
                  aggregation_column="gene")
so <- sleuth_fit(so, ~condition, 'full')
so <- sleuth_fit(so, ~1, 'reduced')
so <- sleuth_lrt(so, 'reduced', 'full')
sleuth_table <- sleuth_results(so, 'reduced:full', 'lrt', show_all = FALSE)
write.csv(sleuth_table, file="sleuth.csv")