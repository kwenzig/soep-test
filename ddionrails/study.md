The testdata is a study in order to reproduce the complex framework and structure of the **SOEP** data in a much simpler way. It is used for testing purposes and is merely fictive: Selected questions from the individual and household questionnaire from SOEP are extracted and data for those variables is created. In total the testdata study consists of three waves, around 10 households and 20 individuals for each wave. The years for which data is available are 2001, 2002 and 2003. According to the SOEP pattern, the individual specific datasets are named *ap*, *bp* and *cp*, whereas the household datasets are called ah, bh and ch. There is additional information on individual basis in the datasets al, bl and cl. Furthermore, a couple variables are calculated by the original variables and can be found in the generated datasets `$pgen`, `$hgen`. General information is provided in the structure datasets: `$pbrutto`, `$hbrutto`, `ppfad` and the weight datasets: `pweight` and `hweight`. All those datasets symbolize the core study in an exemplary manner. The long study is a merged form of the core study data with a new variable indicating the wave.

See the Github repositories:

Repository | Link
----|----
Data | (http://github.com/ddionrails/testdata)
Import | (http://github.com/ddionrails/testdata-import)
Archive | (http://github.com/ddionrails/testdata-archive)
