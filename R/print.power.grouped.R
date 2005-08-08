"print.power.grouped" <-
function (x, ...) {
    cat("\n Two-sample Wald's test power calculation \n \t for grouped data \n")
    cat(paste(format.char(names(x), width = 15, flag = "+"), format(x), sep = " = "), sep = "\n")
    cat("\n")
}
