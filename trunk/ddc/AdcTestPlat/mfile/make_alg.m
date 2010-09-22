% mcc -W lib:libalg -T link:lib AlgDynTest -v 
mcc -B csharedlib:libalg -T link:lib AlgDynTest -v
system('copy_alg.bat')


