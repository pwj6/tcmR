tcmR
==========

tcmR是一个基于R平台的中药网络药理学数据挖掘工具，可以实现的功能包括：将中药转化为化合物、化合物及其对应靶点、常见疾病的靶点、中药和疾病的共同靶点等。

An R package on traditional Chinese medicine and common disease targets.Its functions include: transforming traditional Chinese medicine into compounds, compounds and their corresponding targets, targets of common diseases, common targets of traditional Chinese medicine and diseases, etc.

## Authors

[周晓北] (Zhou Xiaobei)

[彭文杰] (Peng Wenjie)

## Installation

### for Linux,Mac or Win user:

```r
install.packages("devtools")
devtools::install_github("pwj6/tcmR")
```

## Usage

```r
library(tcmR)
y <- h2m(x=c('Ziziphi Spinosae Semen','Abri Herba'),type='latin')
```

"x" is the name of traditional Chinese medicine, which can be the Chinese name(type='chinese') or Chinese Pinyin of traditional Chinese medicine(type='pinyin'), or the Latin name of traditional Chinese medicine(type='latin').

The function of hd2t is to query the corresponding targets of diseases and traditional Chinese medicine, the compounds included in traditional Chinese medicine and the common targets of diseases and traditional Chinese medicine,including molecule,molecule_id,cid.The results are as follows:

```text
y
$`Ziziphi Spinosae Semen`
                                                                                                                                  molecule
 1:                                                                                                                                 Mairin
 2:                                                                                                                                    FER
 3:                                                                                                                         (S)-Coclaurine
 4:                                                                                                                          dl-Nuciferine
 5:                                                                                                                            phytosterol
 6: (2S,3S)-N-[(1S)-1-carbamoyl-3-methyl-butyl]-2-[[(2S)-2-dimethylamino-3-phenyl-propanoyl]amino]-3-(4-formylphenoxy)-4-methyl-valeramide
 7:                                                                                                                               Spinosin
 8:                                                  4H-Benzopyran-4-one, 6-beta-D-glucopyranosyl-5-hydroxy-2-(4-hydroxyphenyl)-7-methoxy-
 9:                                                                                                                              Vicenin-2
10:                                                                                                                                Trochol
11:                                                                                                                          zivulgarin_qt
12:                                                                                                                              swertisin
13:                                                                                                                    n-methylasimilobine
14:                                                                                                                        jujuboside B_qt
15:                                                                                                                           sanjoinine D
16:                                                                                                                 6'-p-coumaroylspinosin
17:                                                                                                                    6'-sinapoylspinosin
18:                                                                                                                           sanjoinine F
19:                                                                                                                           jujuboside B
20:                                                                                                                          sanjoinine G1
21:                                                                                                                           jujuboside A
22:                                                                                                                            Daucosterol
23:                                                                                                                             zivulgarin
24:                                                                                                                        eleutheroside A
25:                                                                                                                           sanjoinenine
26:                                                                                                                        jujuboside A_qt
27:                                                                                                                           sanjoinine B
28:                                                                                                                           sanjoinine A
29:                                                                                             cyclic adenosine 3',5'-monophosphate(cAMP)
30:                                                                                                                            amphibine D
31:                                                                                                                         ceanothic acid
32:                                                                                                                            zizyphusine
33:                                                                                                                        alphitolic acid
                                                                                                                                  molecule
    molecule_id       cid
 1:   MOL000211     64971
 2:   MOL000360    445858
 3:   MOL001522    160487
 4:   MOL001531     22156
 5:   MOL001532  12303666
 6:   MOL001538  11135311
 7:   MOL001540    155692
 8:   MOL001541    124034
 9:   MOL001543    442664
10:   MOL001551     72326
11:   MOL001545 154828025
12:   MOL001542        NA
13:   MOL001530  91746555
14:   MOL001529        NA
15:   MOL001535        NA
16:   MOL001547        NA
17:   MOL001548        NA
18:   MOL001536        NA
19:   MOL001528        NA
20:   MOL001537        NA
21:   MOL001526        NA
22:   MOL001525 129320911
23:   MOL001544        NA
24:   MOL001524        NA
25:   MOL001539        NA
26:   MOL001527        NA
27:   MOL001534        NA
28:   MOL001533        NA
29:   MOL001523  93482395
30:   MOL001550        NA
31:   MOL001521        NA
32:   MOL001546        NA
33:   MOL001549        NA
    molecule_id       cid
```

```r
m2t(x=c('445858','31423'),type='cid',tSource="tcmsp")
```

"x" is the name of the compound, which can be the id(type='molecule_id'), English name (type='molecule')or cid of the compound(type='cid').

"tSource" is the source of compound targets,including tcmsp and pubchem.

The function of m2t is to transform compounds into their corresponding targets and related information.The results are as follows:

```text
 $`445858`
    molecule molecule_id    cid
 1:      FER   MOL000360 445858
 2:      FER   MOL000360 445858
 3:      FER   MOL000360 445858
 4:      FER   MOL000360 445858
 5:      FER   MOL000360 445858
 6:      FER   MOL000360 445858
 7:      FER   MOL000360 445858
 8:      FER   MOL000360 445858
 9:      FER   MOL000360 445858
10:      FER   MOL000360 445858
11:      FER   MOL000360 445858
12:      FER   MOL000360 445858
13:      FER   MOL000360 445858
14:      FER   MOL000360 445858
15:      FER   MOL000360 445858
16:      FER   MOL000360 445858
                                                 fullname   symbol
 1:                          Alpha-2A adrenergic receptor   ADRA2A
 2:                                    Chymotrypsinogen B    CTRB1
 3:            Sodium-dependent noradrenaline transporter   SLC6A2
 4:                          Alpha-1A adrenergic receptor   ADRA1A
 5:                          Alpha-2B adrenergic receptor   ADRA2B
 6:                 Sodium-dependent dopamine transporter   SLC6A3
 7:                            Beta-2 adrenergic receptor    ADRB2
 8:                  Urokinase-type plasminogen activator     PLAU
 9:                       Heat shock protein HSP 90-alpha HSP90AA1
10:                             Leukotriene A-4 hydrolase    LTA4H
11:                   Amine oxidase [flavin-containing] B     MAOB
12:                   Amine oxidase [flavin-containing] A     MAOA
13:                          Prostaglandin G/H synthase 1    PTGS1
14: cAMP-dependent protein kinase catalytic subunit alpha   PRKACA
15:                          Prostaglandin G/H synthase 2    PTGS2
16:                    Nitric-oxide synthase, endothelial     NOS3

$`31423`
   molecule molecule_id   cid                        fullname symbol
1:   pyrene   MOL005805 31423                   Interleukin-8   <NA>
2:   pyrene   MOL005805 31423 UDP-glucuronosyltransferase 1-1   <NA>
3:   pyrene   MOL005805 31423 UDP-glucuronosyltransferase 1-6   <NA>
```
```r
h2t(x=c('Ziziphi Spinosae Semen','Abri Herba'),type='latin',tSource="tcmsp",output='both')
```

"x" is exactly the same as x in h2m.

"tSource" is the source of traditional Chinese medicine targets,including tcmsp and pubchem.

"output" is how much information is output.output='symbol' includes molecule,molecule_id,cid,fullname and symbol;

output='both' includes herb,molecule,molecule_id,cid,fullname,symbol,ob and dl.

The function of h2t is to transform traditional Chinese medicine into its corresponding targets and related information.The results are as follows:

```text
$`Ziziphi Spinosae Semen`
                       herb        molecule molecule_id    cid                                    fullname symbol       ob       dl
  1: Ziziphi Spinosae Semen          Mairin   MOL000211  64971                       Progesterone receptor    PGR 55.37707 0.776100
  2: Ziziphi Spinosae Semen             FER   MOL000360 445858                Alpha-2A adrenergic receptor ADRA2A 39.55852 0.058069
  3: Ziziphi Spinosae Semen             FER   MOL000360 445858                          Chymotrypsinogen B  CTRB1 39.55852 0.058069
  4: Ziziphi Spinosae Semen             FER   MOL000360 445858  Sodium-dependent noradrenaline transporter SLC6A2 39.55852 0.058069
  5: Ziziphi Spinosae Semen             FER   MOL000360 445858                Alpha-1A adrenergic receptor ADRA1A 39.55852 0.058069
 ---                                                                                                                               
144: Ziziphi Spinosae Semen     zizyphusine   MOL001546     NA                           Androgen receptor     AR 41.52695 0.547170
145: Ziziphi Spinosae Semen     zizyphusine   MOL001546     NA                Prostaglandin G/H synthase 1  PTGS1 41.52695 0.547170
146: Ziziphi Spinosae Semen     zizyphusine   MOL001546     NA Sodium channel protein type 5 subunit alpha  SCN5A 41.52695 0.547170
147: Ziziphi Spinosae Semen     zizyphusine   MOL001546     NA                Prostaglandin G/H synthase 2  PTGS2 41.52695 0.547170
148: Ziziphi Spinosae Semen alphitolic acid   MOL001549     NA                                        <NA>   <NA> 23.38245 0.765810

$`Abri Herba`
           herb            molecule molecule_id cid                                                               fullname symbol        ob       dl
  1: Abri Herba protocatechuic acid   MOL000105  72                                                                   <NA>   <NA> 25.366468 0.035092
  2: Abri Herba protocatechuic acid   MOL000105  72                                                               Lysozyme      E 25.366468 0.035092
  3: Abri Herba protocatechuic acid   MOL000105  72 Nicotinate-nucleotide--dimethylbenzimidazole phosphoribosyltransferase   cobT 25.366468 0.035092
  4: Abri Herba protocatechuic acid   MOL000105  72                                       Maltase-glucoamylase, intestinal   MGAM 25.366468 0.035092
  5: Abri Herba protocatechuic acid   MOL000105  72                                                              Trypsin-3  PRSS3 25.366468 0.035092
 ---                                                                                                                                                
365: Abri Herba    kudzusapogenol A   MOL003655  NA                                                                   <NA>   <NA> 16.848452 0.711260
366: Abri Herba     Abrisapogenol F   MOL013317  NA                                                                   <NA>   <NA> 16.366658 0.758840
367: Abri Herba     Abrisapogenol B   MOL013316  NA                                                                   <NA>   <NA> 14.743140 0.735340
368: Abri Herba     Abrisapogenol E   MOL003668  NA                                                                   <NA>   <NA> 17.578022 0.735780
369: Abri Herba       Soyasaponin V   MOL013328  NA                                                                   <NA>   <NA>  2.210538 0.048624
```

```r
m2h(x=c('thalifendine','rosthorin A'),type='molecule',OB='10',DL='0.01')
```

"OB" and "DL"  are the oral bioavailability and drug-like properties of compounds, respectively.Their default values are OB='30' and DL='0.18' respectively. You can also set thresholds according to your own needs.

The function of m2h is to query how many Chinese medicines a compound is contained in and the Latin names of these Chinese medicines.The results are as follows:

```text
$thalifendine
                            herb molecule_id     molecule cid       ob      dl
1: Phellodendri Amurensis Cortex   MOL006422 thalifendine  NA 44.41094 0.72588
2: Phellodendri Chinrnsis Cortex   MOL006422 thalifendine  NA 44.41094 0.72588
3:  Thalictri Glandulosissimi Et   MOL006422 thalifendine  NA 44.41094 0.72588
4:          Semiaquilegiae Radix   MOL006422 thalifendine  NA 44.41094 0.72588

$`rosthorin A`
           herb molecule_id    molecule cid       ob      dl
1: Ricini Semen   MOL008144 rosthorin A  NA 28.65893 0.56412

```r
d2t(x=c('C0009375','C0271979'),type='diseaseID',score=0.4)
```

"x" is the name of the disease, and can be the English name(type='disease') or id(type='diseaseID') of the disease.

"score" is the score of disease targets, which can be used to screen targets. The default value is 0.3, and you can also set thresholds according to your actual needs.

The function of d2t is to query the targets corresponding to the disease and relevant information.The results are as follows:

```text
$C0009375
    symbol score
 1:    APC  0.60
 2:   BCL2  0.56
 3: CDKN1A  0.40
 4: CTNNB1  0.40
 5:  DNMT1  0.52
 6:   EGFR  0.40
 7:   KRAS  0.40
 8:   MLH1  0.40
 9:   MMP9  0.54
10:    MYC  0.53
11:  PPARG  0.40
12:  PTGS2  0.60
13:   TP53  0.50
14:  VEGFA  0.40

$C0271979
   symbol score
1:   HBA2   0.4
2:    HBB   0.4
```

```r
hd2t(hb=c('mahuang','huangqi'),Disease='C0019209',htype='pinyin',dtype='diseaseID',tSource='tcmsp')
```

"hb" is exactly the same as x in h2m;"Disease" is exactly the same as x in d2t;"htype" is exactly the same as type in h2m;"dtype" is exactly the same as type in d2t;"tSource" is exactly the same as tSource in h2t.

The function of hd2t is to query the corresponding targets of diseases and traditional Chinese medicine, the compounds included in traditional Chinese medicine and the common targets of diseases and traditional Chinese medicine.The results are as follows:

```text
$mahuang
$mahuang$drug_target
               herb                                molecule molecule_id       cid                           fullname symbol       ob       dl
   1: Ephedra Herba                                luteolin   MOL000006   5280445                               <NA>   <NA> 36.16263 0.245520
   2: Ephedra Herba                                luteolin   MOL000006   5280445                   Insulin receptor   INSR 36.16263 0.245520
   3: Ephedra Herba                                luteolin   MOL000006   5280445                DNA topoisomerase 1   topA 36.16263 0.245520
   4: Ephedra Herba                                luteolin   MOL000006   5280445                   Heme oxygenase 1  pbsA1 36.16263 0.245520
   5: Ephedra Herba                                luteolin   MOL000006   5280445         72 kDa type IV collagenase   MMP2 36.16263 0.245520
  ---                                                                                                                                        
3816: Ephedra Herba 1,5,8-trimethyl-1,2-dihydro-naphthalene   MOL010789 137331948       Prostaglandin G/H synthase 1  PTGS1 53.22308 0.059796
3817: Ephedra Herba 1,5,8-trimethyl-1,2-dihydro-naphthalene   MOL010789 137331948            D(1A) dopamine receptor   DRD1 53.22308 0.059796
3818: Ephedra Herba 1,5,8-trimethyl-1,2-dihydro-naphthalene   MOL010789 137331948       Prostaglandin G/H synthase 2  PTGS2 53.22308 0.059796
3819: Ephedra Herba 1,5,8-trimethyl-1,2-dihydro-naphthalene   MOL010789 137331948 Nitric-oxide synthase, endothelial   NOS3 53.22308 0.059796
3820: Ephedra Herba                               cinerolon   MOL011873  92966642                               <NA>   <NA> 75.62580 0.036324

$mahuang$disease_target
      symbol diseaseID      disease score
 1:     A1BG  C0019209 Hepatomegaly   0.3
 2:      AHR  C0019209 Hepatomegaly   0.3
 3:      ALB  C0019209 Hepatomegaly   0.3
 4:  ALDH1B1  C0019209 Hepatomegaly   0.3
 5:   CAMK2A  C0019209 Hepatomegaly   0.3
 6:    CRYGD  C0019209 Hepatomegaly   0.3
 7:   MAPK14  C0019209 Hepatomegaly   0.3
 8:     CYBA  C0019209 Hepatomegaly   0.4
 9:   CYP1A1  C0019209 Hepatomegaly   0.3
10:   CYP1A2  C0019209 Hepatomegaly   0.3
11:   CYP1B1  C0019209 Hepatomegaly   0.3
12:   ADAM3A  C0019209 Hepatomegaly   0.3
13:    DSCAM  C0019209 Hepatomegaly   0.3
14:    FGF12  C0019209 Hepatomegaly   0.3
15:    NR5A2  C0019209 Hepatomegaly   0.3
16:      HDC  C0019209 Hepatomegaly   0.3
17:     IGKC  C0019209 Hepatomegaly   0.3
18:      LEP  C0019209 Hepatomegaly   0.3
19:     LEPR  C0019209 Hepatomegaly   0.3
20:    MYO1B  C0019209 Hepatomegaly   0.3
21:   TRIM37  C0019209 Hepatomegaly   0.4
22:   NFE2L2  C0019209 Hepatomegaly   0.3
23:     NOS2  C0019209 Hepatomegaly   0.3
24:     NOS3  C0019209 Hepatomegaly   0.3
25:     PEPD  C0019209 Hepatomegaly   0.4
26:    PPARA  C0019209 Hepatomegaly   0.3
27:     RELA  C0019209 Hepatomegaly   0.3
28:    TGFB1  C0019209 Hepatomegaly   0.4
29:    NR1H2  C0019209 Hepatomegaly   0.3
30:    KLF11  C0019209 Hepatomegaly   0.3
31:    COPS3  C0019209 Hepatomegaly   0.3
32:    ABCC3  C0019209 Hepatomegaly   0.3
33:    NR1I2  C0019209 Hepatomegaly   0.3
34:     ATG5  C0019209 Hepatomegaly   0.3
35: ADAMTSL2  C0019209 Hepatomegaly   0.4
36:    KEAP1  C0019209 Hepatomegaly   0.3
37:    NR1I3  C0019209 Hepatomegaly   0.3
38:    NR1H4  C0019209 Hepatomegaly   0.3
39:  ADAMTS5  C0019209 Hepatomegaly   0.3
40:   AKR7A3  C0019209 Hepatomegaly   0.3
41:     MLC1  C0019209 Hepatomegaly   0.3
42:    DAPK2  C0019209 Hepatomegaly   0.3
43:  SLC29A3  C0019209 Hepatomegaly   0.4
44:    SESN2  C0019209 Hepatomegaly   0.3
45:     CYGB  C0019209 Hepatomegaly   0.3
46:  GALNT13  C0019209 Hepatomegaly   0.3
47:   MBOAT2  C0019209 Hepatomegaly   0.3
48:   GPR155  C0019209 Hepatomegaly   0.3
49:   SBSPON  C0019209 Hepatomegaly   0.3
50:   PRSS35  C0019209 Hepatomegaly   0.3
51: CABCOCO1  C0019209 Hepatomegaly   0.3
52:    STAC3  C0019209 Hepatomegaly   0.3
53:   MIR192  C0019209 Hepatomegaly   0.3
54:    ACOT1  C0019209 Hepatomegaly   0.3
      symbol diseaseID      disease score

$mahuang$drug_chemical
                                    molecule molecule_id       cid
  1:                                luteolin   MOL000006   5280445
  2:                                Cosmetin   MOL000007   5280704
  3:                                apigenin   MOL000008   5280443
  4:                            Arachic acid   MOL000012     10467
  5:                          alpha-humulene   MOL000024   5281520
 ---                                                              
359:                            Trans-ionone   MOL010787   1550720
360:               2,6,10-trimethyl-dodecane   MOL004982  98058914
361:                         beta-Bourbonene   MOL000611     62566
362: 1,5,8-trimethyl-1,2-dihydro-naphthalene   MOL010789 137331948
363:                               cinerolon   MOL011873  92966642

$mahuang$drug_disease_target
  samesymbol
1        AHR
2       NOS3
3      NR1H4
4       NOS2
5    ALDH1B1
6     MAPK14
7        HDC


$huangqi
$huangqi$drug_target
                            herb
  1: Hedysarum Multijugum Maxim.
  2: Hedysarum Multijugum Maxim.
  3: Hedysarum Multijugum Maxim.
  4: Hedysarum Multijugum Maxim.
  5: Hedysarum Multijugum Maxim.
 ---                            
957: Hedysarum Multijugum Maxim.
958: Hedysarum Multijugum Maxim.
959: Hedysarum Multijugum Maxim.
960: Hedysarum Multijugum Maxim.
961: Hedysarum Multijugum Maxim.
                                                                                                                                                      molecule
  1: (3S,8S,9S,10R,13R,14S,17R)-10,13-dimethyl-17-[(2R,5S)-5-propan-2-yloctan-2-yl]-2,3,4,7,8,9,11,12,14,15,16,17-dodecahydro-1H-cyclopenta[a]phenanthren-3-ol
  2:                                                                                                                                                        L-
  3:                                                                                                                                                        L-
  4:                                                                                                                                                  Prolinum
  5:                                                                                                                                                  Prolinum
 ---                                                                                                                                                          
957:                                                                                                            5'-hydroxyiso-muronulatol-2',5'-di-O-glucoside
958:                                                                                                                                        AstragalosideIV_qt
959:                                                                                                                                         astragalosideⅣ_qt
960:                                                                                                                                         astragalosideⅢ_qt
961:                                                                                                                                  acetylastragaloside I_qt
     molecule_id      cid                     fullname symbol        ob       dl
  1:   MOL000033 15976101        Progesterone receptor    PGR 36.228471 0.782880
  2:   MOL000054    28782 Nitric-oxide synthase, brain   NOS1 47.642002 0.031878
  3:   MOL000054    28782 Prostaglandin G/H synthase 2  PTGS2 47.642002 0.031878
  4:   MOL000061  6971047                         <NA>   <NA> 77.574681 0.014161
  5:   MOL000061  6971047          Cytochrome P450-cam   camC 77.574681 0.014161
 ---                                                                            
957:   MOL000374       NA                         <NA>   <NA> 41.717666 0.692510
958:   MOL000410       NA                         <NA>   <NA>  7.072843 0.315580
959:   MOL000408       NA                         <NA>   <NA>  7.072843 0.315350
960:   MOL000406       NA                         <NA>   <NA>  5.351777 0.315370
961:   MOL000435       NA                         <NA>   <NA> 30.753178 0.172370

$huangqi$disease_target
      symbol diseaseID      disease score
 1:     A1BG  C0019209 Hepatomegaly   0.3
 2:      AHR  C0019209 Hepatomegaly   0.3
 3:      ALB  C0019209 Hepatomegaly   0.3
 4:  ALDH1B1  C0019209 Hepatomegaly   0.3
 5:   CAMK2A  C0019209 Hepatomegaly   0.3
 6:    CRYGD  C0019209 Hepatomegaly   0.3
 7:   MAPK14  C0019209 Hepatomegaly   0.3
 8:     CYBA  C0019209 Hepatomegaly   0.4
 9:   CYP1A1  C0019209 Hepatomegaly   0.3
10:   CYP1A2  C0019209 Hepatomegaly   0.3
11:   CYP1B1  C0019209 Hepatomegaly   0.3
12:   ADAM3A  C0019209 Hepatomegaly   0.3
13:    DSCAM  C0019209 Hepatomegaly   0.3
14:    FGF12  C0019209 Hepatomegaly   0.3
15:    NR5A2  C0019209 Hepatomegaly   0.3
16:      HDC  C0019209 Hepatomegaly   0.3
17:     IGKC  C0019209 Hepatomegaly   0.3
18:      LEP  C0019209 Hepatomegaly   0.3
19:     LEPR  C0019209 Hepatomegaly   0.3
20:    MYO1B  C0019209 Hepatomegaly   0.3
21:   TRIM37  C0019209 Hepatomegaly   0.4
22:   NFE2L2  C0019209 Hepatomegaly   0.3
23:     NOS2  C0019209 Hepatomegaly   0.3
24:     NOS3  C0019209 Hepatomegaly   0.3
25:     PEPD  C0019209 Hepatomegaly   0.4
26:    PPARA  C0019209 Hepatomegaly   0.3
27:     RELA  C0019209 Hepatomegaly   0.3
28:    TGFB1  C0019209 Hepatomegaly   0.4
29:    NR1H2  C0019209 Hepatomegaly   0.3
30:    KLF11  C0019209 Hepatomegaly   0.3
31:    COPS3  C0019209 Hepatomegaly   0.3
32:    ABCC3  C0019209 Hepatomegaly   0.3
33:    NR1I2  C0019209 Hepatomegaly   0.3
34:     ATG5  C0019209 Hepatomegaly   0.3
35: ADAMTSL2  C0019209 Hepatomegaly   0.4
36:    KEAP1  C0019209 Hepatomegaly   0.3
37:    NR1I3  C0019209 Hepatomegaly   0.3
38:    NR1H4  C0019209 Hepatomegaly   0.3
39:  ADAMTS5  C0019209 Hepatomegaly   0.3
40:   AKR7A3  C0019209 Hepatomegaly   0.3
41:     MLC1  C0019209 Hepatomegaly   0.3
42:    DAPK2  C0019209 Hepatomegaly   0.3
43:  SLC29A3  C0019209 Hepatomegaly   0.4
44:    SESN2  C0019209 Hepatomegaly   0.3
45:     CYGB  C0019209 Hepatomegaly   0.3
46:  GALNT13  C0019209 Hepatomegaly   0.3
47:   MBOAT2  C0019209 Hepatomegaly   0.3
48:   GPR155  C0019209 Hepatomegaly   0.3
49:   SBSPON  C0019209 Hepatomegaly   0.3
50:   PRSS35  C0019209 Hepatomegaly   0.3
51: CABCOCO1  C0019209 Hepatomegaly   0.3
52:    STAC3  C0019209 Hepatomegaly   0.3
53:   MIR192  C0019209 Hepatomegaly   0.3
54:    ACOT1  C0019209 Hepatomegaly   0.3
      symbol diseaseID      disease score

$huangqi$drug_chemical
                                                                                                                                                     molecule
 1: (3S,8S,9S,10R,13R,14S,17R)-10,13-dimethyl-17-[(2R,5S)-5-propan-2-yloctan-2-yl]-2,3,4,7,8,9,11,12,14,15,16,17-dodecahydro-1H-cyclopenta[a]phenanthren-3-ol
 2:                                                                                                                                                        L-
 3:                                                                                                                                                  Prolinum
 4:                                                                                                                                             palmitic acid
 5:                                                                                                                                                 quercetin
 6:                                                                                                                                             vanillic acid
 7:                                                                                                                                                       EIC
 8:                                                                                                                                                    Mairin
 9:                                                                                                                                                   Jaranol
10:                                                                                                                                              Rhamnocitrin
11:                                                                                                                                              isorhamnetin
12:                                                                                                                                                    lupeol
13:                                                                                                                                   3,9-di-O-methylnissolin
14:                                                                                                                                      3-Hydroxy-2-picoline
15:   (2S)-4-methoxy-7-methyl-2-[1-methyl-1-[(2S,3R,4S,5S,6R)-3,4,5-trihydroxy-6-methylol-tetrahydropyran-2-yl]oxy-ethyl]-2,3-dihydrofuro[3,2-g]chromen-5-one
16:                                                                                                7,2'-dihydroxy-3',4'-dimethoxyisoflavone-7-O-β-D-glucoside
17:                                                                                                      7-hydroxy-3-(2-hydroxy-3,4-dimethoxy-phenyl)chromone
18:                                                                                                                                 7-O-methylisomucronulatol
19:                                                                                (6aR,11aR)-9,10-dimethoxy-6a,11a-dihydro-6H-benzofurano[3,2-c]chromen-3-ol
20:                                                                                                                      13-hydroxy-9,11-octadecadienoic acid
21:                                                                                                                                               Arabinose,d
22:                                                                                                                          D-Galacturonic acid, homopolymer
23:                                                                                                                                        DL-Glucuronic acid
24:                                                                                                                                          Fucopyranose, L-
25:                                                                                                                                                 Bifendate
26:                                                                                                                                   gamma-aminobutyric acid
27:                                                                                                                                        FERULIC ACID (CIS)
28:                                                                                                                                                  daidzein
29:                                                                                                                                                    Ononin
30:                                                                                                                                              formononetin
31:                                                                                                                                             Soyasaponin I
32:                                                                                                                                                   choline
33:                                                                                                                                                       GGB
34:                                                                                                                                        (+)-Syringaresinol
35:                                                                                                                                           cis-p-Coumarate
36:                                                                                                                                               Docosanoate
37:                                                                                                                                                  Flavaxin
38:                                                                                                                                          Astraisoflavanin
39:                                                                                                                                              Mucronulatol
40:                                                                                                                                                  Caffeate
41:                                                                                                                                                     rutin
42:                                                                                                                                             Lariciresinol
43:                                                                                                                                                 Calycosin
44:                                                                                                      3'-Hydroxy-4'-methoxyisoflavone-7-O-beta-D-glucoside
45:                                                                                                                                                       XLS
46:                                                                                                                                            nicotinic acid
47:                                                                                                                                                kaempferol
48:                                                                                                                                rhamnocitrin-3-O-glucoside
49:                                                                                                                                                       RAM
50:                                                                                                                                                Crystal VI
51:                                                                                                                                                   betaine
52:                                                                                                                                                  coumarin
53:                                                                                                                                            linolenic acid
54:                                                                                                                                                        FA
55:                                                                                            (Z)-1-(2,4-dihydroxyphenyl)-3-(4-hydroxyphenyl)prop-2-en-1-one
56:                                                                                                                                                 Hirsutrin
57:                                                                                                        (3R)-3-(2-hydroxy-3,4-dimethoxyphenyl)chroman-7-ol
58:                                                                                                                      isomucronulatol-7,2'-di-O-glucosiole
59:                                                                                                                                                  LUPENONE
60:                                                                                                                  1,7-Dihydroxy-3,9-dimethoxy pterocarpene
61:                                                                                                                                                 Heriguard
62:                                                                                                                                           isoferulic acid
63:                                                                                                                                          asernestioside A
64:                                                                                                                                           astragalosideII
65:                                                                                                                                       asernestioside B_qt
66:                                                                                                                                          asernestioside B
67:                                                                                                                                            astragalosideⅢ
68:                                                                                                                                         astragalosideI_qt
69:                                                                                                                                              isoflavanone
70:                                                                                                                                        astragalosideII_qt
71:                                                                                                                                      astrasieversianin XV
72:                                                                                                                                     acetylastragaloside I
73:                                                                                                                                            astragalosideI
74:                                                                                                                                               hederagenin
75:                                                                                                         5'-hydroxyiso-muronulatol-2',5'-di-O-glucoside_qt
76:                                                                                                                                       asernestioside A_qt
77:                                                                                                                                         astrachrysoside A
78:                                                                                                                                                alexandrin
79:                                                                                                               9,10-dimethoxypterocarpan-3-O-β-D-glucoside
80:                                                                                                                   isomucronulatol-7,2'-di-O-glucosiole_qt
81:                                                                                                                                           AstragalosideIV
82:                                                                                                                                            astragalosideⅣ
83:                                                                                                            5'-hydroxyiso-muronulatol-2',5'-di-O-glucoside
84:                                                                                                                                        AstragalosideIV_qt
85:                                                                                                                                         astragalosideⅣ_qt
86:                                                                                                                                         astragalosideⅢ_qt
87:                                                                                                                                  acetylastragaloside I_qt
                                                                                                                                                     molecule
    molecule_id       cid
 1:   MOL000033  15976101
 2:   MOL000054     28782
 3:   MOL000061   6971047
 4:   MOL000069       985
 5:   MOL000098   5280343
 6:   MOL000114      8468
 7:   MOL000131   5280450
 8:   MOL000211     64971
 9:   MOL000239   5318869
10:   MOL000251   5320946
11:   MOL000354   5281654
12:   MOL000356    259846
13:   MOL000371  15689655
14:   MOL000372     70719
15:   MOL000373  21670038
16:   MOL000376  46899140
17:   MOL000377   5359024
18:   MOL000378  15689652
19:   MOL000380  14077830
20:   MOL000381  21159006
21:   MOL000382     66308
22:   MOL000383     84740
23:   MOL000384     65041
24:   MOL000386   3034656
25:   MOL000387    108213
26:   MOL000388   6992099
27:   MOL000389   1548883
28:   MOL000390   5281708
29:   MOL000391    442813
30:   MOL000392   5280378
31:   MOL000393    122097
32:   MOL000394       305
33:   MOL000395  46224610
34:   MOL000396    443023
35:   MOL000397   1549106
36:   MOL000399      8215
37:   MOL000400      6759
38:   MOL000411    131420
39:   MOL000412    442811
40:   MOL000414   1549111
41:   MOL000415   5280805
42:   MOL000416    332427
43:   MOL000417   5280448
44:   MOL000418   5318267
45:   MOL000420    644160
46:   MOL000421       938
47:   MOL000422   5280863
48:   MOL000423  14704550
49:   MOL000424    439710
50:   MOL000429   6992089
51:   MOL000430       248
52:   MOL000431       323
53:   MOL000432   5280934
54:   MOL000433      6037
55:   MOL000436   6603886
56:   MOL000437   5280804
57:   MOL000438  10380176
58:   MOL000439  15689653
59:   MOL000441     92158
60:   MOL000442   5316760
61:   MOL001955   1794427
62:   MOL005928    736186
63:   MOL000425        NA
64:   MOL000403        NA
65:   MOL000428        NA
66:   MOL000427        NA
67:   MOL000405        NA
68:   MOL000402        NA
69:   MOL000398        NA
70:   MOL000404        NA
71:   MOL000419  92043815
72:   MOL000434        NA
73:   MOL000401        NA
74:   MOL000296        NA
75:   MOL000375        NA
76:   MOL000426        NA
77:   MOL000413        NA
78:   MOL000295        NA
79:   MOL000379 101679160
80:   MOL000440        NA
81:   MOL000409        NA
82:   MOL000407 124708541
83:   MOL000374        NA
84:   MOL000410        NA
85:   MOL000408        NA
86:   MOL000406        NA
87:   MOL000435        NA
    molecule_id       cid

$huangqi$drug_disease_target
  samesymbol
1        AHR
2       NOS3
3       NOS2
4     MAPK14
```

## Relational graph of all functions and data




























![1627034863](https://user-images.githubusercontent.com/72773400/126767945-38e5eee1-443a-4590-b561-a9c731734f5d.png)
