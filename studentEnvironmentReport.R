if(!require("readr")){
  install.packages("readr")
}
sink("report.txt")
cat("---from Sys.getenv---\n")
Sys.getenv()
cat("---from Sys.getlocale---\n")
Sys.getlocale()
cat("---from readr::locale---\n")
readr::locale()
cat("---from sessionInfo---\n")
sessionInfo()
cat("---from version---\n")
version
Sys.getenv() -> envSys
cat('---list.file under R_HOME/etc ---\n')
list.files(file.path(envSys[names(envSys)=='R_HOME'],'etc')) -> etc.list
etc.list
if("Renviron" %in% etc.list){
  cat('---Renviron file---\n')
  file.path(envSys[names(envSys)=='R_HOME'],'etc',"Renviron") -> filename_environ
  readLines(filename_environ)
}
if("Rconsole" %in% etc.list){
  cat('---Rconsole file---\n')
  file.path(envSys[names(envSys)=='R_HOME'],'etc',"Rconsole") -> filename_rconsole
  readLines(filename_rconsole)
}
if("Rprofile.site" %in% etc.list){
  cat('---Rprofile.site file---\n')
  file.path(envSys[names(envSys)=='R_HOME'],'etc',"Rprofile.site") -> filename_rprofile
  readLines(filename_rprofile)
}
if("sysname" %in% names(Sys.info())){
  info_sys <- Sys.info()
  if(stringr::str_detect(toupper(info_sys["sysname"]),"WINDOWS")){
    cat("--- Windows language region setting---\n")
    system("dism /online /get-intl")
  }
}
sink()
warning(
  'Please upload the following file: \n',
  file.path(getwd(),"report.txt"),
  '\nto the following website:\n',
  'https://forms.gle/vPoQ1MC4cNEJuNqM8'
)
