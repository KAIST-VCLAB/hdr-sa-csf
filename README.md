# Modelling Surround-aware Contrast Sensitivity for HDR Displays

#### [Project Page](http://vclab.kaist.ac.kr/cgf2022/index.html) | [Paper](http://vclab.kaist.ac.kr/cgf2022/CGF22-paper.pdf) | [Presentation](http://vclab.kaist.ac.kr/egsr2021/EGSR21-presentation.pdf)

Authors:   Shinyoung Yi, Daniel S. Jeon,  Ana Serrano, Se-Yoon Jeong, Hui-Yong Kim, Diego Gutierrez, Min H. Kim

Institute: KAIST Visual Computing Laboratory

If you use our data or code for your academic work, please cite our paper:

```
@Journal{Yi_2022_CGF,
author = {Shinyoung Yi and Daniel S. Jeon and Ana Serrano and 
  Se-Yoon Jeong and Hui-Yong Kim and Diego Gutierrez and Min H. Kim},
title = {Modelling Surround-aware Contrast Sensitivity for HDR Displays},
booktitle = {Computer Graphics Forum (CGF)},
month = {January},
year = {2022}
}
```

## Installation

Our code was implemented and tested on MATLAB R2021a.

## Data

We provide measured surround-aware contrast sensitivity data in `csf_measurement`. In this directory, MATLAB `.mat` file `csf_13sbj.mat` contains the experimental data. The data file stores averaged values over 13 subjects (10 males and 3 females) with an age range of 20 to 45 years.

The file consists of the same variables, as follows:

* `calib` $5\times5$: Luminance calibration data for our HDR display in the unit of $\mathrm{cd/m^2=nits}$. Calibrated stimulus luminance $L$ for control signals of the $i$-th level of $L$ and the $j$-th level of $L_s$ is stored in `calib(i,j)`. Calibrated surrounding luminance $L_s$ for for control signals of the $i$-th level of $L$ and the $j$-th level of $L_s$ is equal to `calib(j,j)`.
* `freqs` $1\times5$: Five levels of spatial frequencies $u$ in the unit of cycles per degree.
* `csf` $2\times5\times5\times5$: `csf(d,i,j,k)` stores horizontal CSF if `d=1`, and it stores vertical one if $d=2$. `i`, `j`, and `k` denote the level of stimulus luminance $L$, surrounding luminance $L_s$, and spatial frequency $u$, respectively. `csf` stores averaged data over all participants. While the averages were taken in the log space, stored values in `csf` denote linear values of contrast sensitivity.
* `csf_vh` $5\times5\times5$: Direction-averaged version of `csf`. The average was also taken in the log space.
* `sigmalog` $2\times5\times5\times5$: Standard deviations for `csf` over participants.
* `sigmalog_vh` $5\times5\times5$: Standard deviations of `csf_vh` over participants.

These data are also stored in `.xlsx` files in the same directory.

## Usage

Our practical and full surround-aware CSF models are written in `csf_model/SCSF_pract.m` and `csf_model/SCSF_full.m`, respectively. The variables $u$, $L$, and $L_s$ denote spatial frequency, stimulus luminance, and surrounding luminance, respectively. `example.m` contains an example code for calculate predicted S-CSF values for both the practical and full models.

## Errata in the paper

We report that the published paper contains typos in the first row of Table 1 (constants for the full S-CSF model only), so we write the corrected one here:

| $R$ model | $a$       | $p_1$     | $p_2$    | $q_1$  | $q_2$  | $q_3$    | $\sigma_0$ | $\eta$   | $k$       |
| --------- | --------- | --------- | -------- | ------ | ------ | -------- | ---------- | -------- | --------- |
|           | $0.07935$ | $-0.6363$ | $0.2157$ | $2246$ | $0.65$ | $-15.56$ | $0.0103$   | $0.0148$ | $10.1826$ |

These corrected values are also contained in `csf_model/SCSF_full.m`.

## License

Shinyoung Yi, Daniel S. Jeon and Min H. Kim have developed this software and related documentation (the "Software"); confidential use in source form of the Software, without modification, is permitted provided that the following conditions are met:

Neither the name of the copyright holder nor the names of any contributors may be used to endorse or promote products derived from the Software without specific prior written permission.

The use of the software is for Non-Commercial Purposes only. As used in this Agreement, "Non-Commercial Purpose" means for the purpose of education or research in a non-commercial organisation only. "Non-Commercial Purpose" excludes, without limitation, any use of the Software for, as part of, or in any way in connection with a product (including software) or service which is sold, offered for sale, licensed, leased, published, loaned or rented. If you require a license for a use excluded by this agreement, please email [minhkim@kaist.ac.kr].

Warranty: KAIST-VCLAB MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF THE SOFTWARE, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. KAIST-VCLAB SHALL NOT BE LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.

Please refer to license.txt for more details. 

## Contact

If you have any questions, please feel free to contact us.

Shinyoung Yi (syyi@vclab.kaist.ac.kr)

Daniel S. Jeon (sjjeon@vclab.kaist.ac.kr)

Min H. Kim (minhkim@vclab.kaist.ac.kr)
