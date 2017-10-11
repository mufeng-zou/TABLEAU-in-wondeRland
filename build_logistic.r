getsql <- function(server,query) {
  
  ODBC_string <- paste0("Driver={SQL Server};Server={",server,"};Trusted_Connection=true")
  
  conn <- RODBC::odbcDriverConnect(ODBC_string, readOnlyOptimize = T)
  
  df <- RODBC::sqlQuery(conn, query)
  
  RODBC::odbcClose(conn)
  
  return(df)
}

df <- getsql('apprwidb006', 'select * from MAWORK_DSOL.[CORP\\Mufeng.Zou].innovation_201710_modelfit')
colnames(df)

model <- glm(factor(gbf)~z_name_time_0+z_sa24_dist_sub+z_sat_dist_acc+th_nonDASR_enq_count, data=df, family = binomial(link = "logit"))
pROC::auc(model$y,model$fitted.values)

save(model, file='data/logistic_model.rdata')
