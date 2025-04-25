#!/bin/sh

#Author: Batu Kaya
#Publication: Kaya et al. 2025, Imaging Neuroscience, https://doi.org/10.1162/imag_a_00567

DIR=#Set study directory here

#Populate the for loop with the subject IDs

thr3t_rcea=(22 18 12 16 16 18 20 16 16 16 14 16 18 20 12 14 22 22 16 16 18 20 18 18 12 16 16 18 18 18 12 18 14 22 18 14 18 18 16 18 16 18 16 16 16 18 18 16 18 14 18 18 16 16 14 16 18 20 18 18 14 16 14 24 14 18 16 16 16 16 10 14 12 16 18 20 16 18 18 18 18 18 16 18 14 16 18 18 16 20 18 18 14 20 16 20 18 18 18 18 22 22 20 16 18 16 16 18 16 16 14 16 14 18 22 16 18 16 14 20 24 22 14 14 22 16 14 18 16 20 18 18 18 14 18 16 12 12 18 22 16 20 14 16 18 14 14 16 16 16 20 20 14 20 16 16 20 16 20 14 22 16 18 16 18)
thr3t_rblat=(152	130	120	124	140	124	150	122	160	128	126	138	128	156	120	106	142	154	132	132	122	148	142	126	108	122	112	136	150	174	112	128	136	172	154	134	132	136	134	148	146	156	144	128	132	148	130	128	136	130	156	126	114	126	134	116	148	142	128	154	124	130	142	164	134	142	154	132	132	118	116	128	118	152	142	170	132	136	144	136	120	130	136	128	150	128	150	122	130	158	134	138	148	152	126	146	136	158	124	132	164	150	160	124	142	146	134	124	130	120	114	132	124	140	132	124	140	108	120	148	166	158	142	142	152	140	128	166	110	160	146	140	132	116	138	128	120	124	148	158	150	146	124	128	128	110	126	144	134	158	152	146	134	142	132	122	162	134	156	146	142	122	134	146	152)
thr3t_lcea=(22	16	16	20	22	22	22	14	26	14	16	20	22	24	20	12	18	22	18	14	20	22	20	18	18	12	20	20	18	24	12	16	16	22	20	18	20	24	18	18	18	20	22	18	12	20	22	18	18	18	18	14	16	16	22	20	20	16	18	20	16	16	18	20	12	16	22	18	14	16	12	18	20	22	22	24	18	18	22	22	18	18	22	16	22	18	24	14	16	22	18	20	18	20	16	14	16	24	18	18	22	20	16	20	18	18	18	12	16	16	14	16	22	20	18	12	18	18	20	18	24	22	16	20	22	18	18	26	20	20	22	16	24	12	22	14	14	16	18	16	14	22	14	14	20	12	16	18	20	26	20	18	18	18	22	14	20	22	18	20	22	22	20	24	22)
thr3t_lblat=(146	138	118	130	138	132	156	120	154	130	122	132	132	166	120	106	148	144	128	124	134	150	150	130	116	124	116	128	144	166	106	116	134	168	148	136	132	136	136	150	134	146	152	132	130	156	134	126	132	132	154	120	110	124	132	120	152	138	138	150	130	128	126	156	130	132	152	126	130	116	118	114	126	150	150	156	138	132	150	134	120	126	142	134	146	124	148	120	120	152	134	138	136	148	132	144	140	146	130	128	160	142	158	120	138	134	130	108	120	118	110	128	120	140	132	110	136	118	122	148	170	166	148	132	140	144	122	152	110	150	134	124	134	102	136	118	122	128	154	148	146	156	116	130	124	102	124	152	130	166	154	156	130	134	126	110	142	148	150	142	158	120	128	154	152)

thr7t_rcea=(62	62	48	50	60	50	70	46	58	42	40	46	46	74	32	46	58	66	40	42	46	44	74	60	44	46	50	48	52	56	44	56	40	60	42	44	42	62	64	68	56	52	60	38	50	46	50	42	42	50	52	42	50	44	56	48	48	46	52	52	54	36	56	62	52	48	56	44	48	40	40	38	40	68	44	88	42	40	68	38	54	40	60	66	56	42	70	40	50	72	42	42	40	46	54	62	52	58	50	52	60	44	50	44	46	46	58	44	36	40	44	44	50	46	54	46	40	44	40	54	62	60	56	38	48	60	52	48	42	56	38	46	46	44	42	44	48	46	64	44	60	66	32	50	34	42	56	52	62	72	64	70	34	44	48	46	84	58	44	50	62	52	48	70	62)
thr7t_rblat=(268	244	224	246	260	254	302	214	316	240	240	256	274	296	246	208	268	324	226	250	278	296	262	276	212	238	216	250	280	316	194	226	254	324	250	246	258	276	280	302	272	258	262	244	256	290	258	274	256	248	298	236	234	250	258	236	284	270	262	310	270	234	254	332	254	240	306	258	242	224	218	234	236	282	288	336	288	246	288	232	220	260	250	258	294	244	292	230	238	296	272	262	262	314	256	278	244	286	232	254	350	262	304	228	284	280	250	222	248	238	218	228	220	240	244	226	268	218	244	288	288	328	250	268	242	284	256	306	216	298	282	238	274	234	256	248	242	254	292	282	308	288	214	236	240	216	250	288	240	338	274	300	252	264	250	238	348	292	308	298	288	246	268	308	268)
thr7t_lcea=(50	52	38	58	50	50	72	38	80	56	44	50	52	64	42	38	46	62	46	62	58	60	58	52	48	56	44	58	54	52	54	54	66	44	52	44	48	62	52	66	72	48	74	48	52	50	48	42	46	52	52	52	58	42	44	46	42	46	42	72	40	48	58	78	42	64	44	48	46	44	46	40	42	64	62	62	56	52	62	46	42	50	58	62	42	40	86	44	42	46	52	50	52	54	46	50	42	58	44	48	60	48	72	40	40	56	42	56	52	46	40	48	40	48	42	48	44	40	46	54	80	52	72	44	68	50	42	54	44	54	50	68	50	46	50	54	40	48	54	54	46	46	40	44	50	34	56	50	60	72	50	74	48	54	48	48	64	72	46	72	64	44	56	54	58)
thr7t_lblat=(268	274	236	238	260	266	258	216	326	258	236	252	284	324	218	202	260	316	228	252	236	262	260	252	204	224	200	272	302	296	212	246	258	284	258	252	250	268	286	314	252	274	302	254	226	302	236	238	256	242	288	240	228	238	256	240	284	264	260	324	244	226	242	334	228	266	298	254	248	200	226	222	242	284	308	336	278	262	288	276	212	242	280	242	280	228	300	222	234	260	270	258	282	284	254	312	250	300	242	242	308	286	306	232	278	246	250	224	240	218	212	226	256	264	242	248	254	210	242	284	350	322	268	256	272	280	240	296	214	250	254	256	268	230	250	246	240	250	290	276	278	294	222	240	248	216	250	280	246	330	276	292	234	268	260	228	306	316	272	300	288	222	256	296	262)

for i in ... ; do 

#7T

 a=-1
 a=$((a+1))

# VISUALIZATION & GROUP MAPS: 
#Threshold fdt_paths images (10000*.0002*Number of voxels in the origin seed; grab the thr value from the corresponding arrays defined earlier in the script) for the circuit of interest & control circuit in native DWI space

 #DWI Space First

	#Right CeA-RCS	
		fslmaths $DIR/${i}/probtrackx_7T/R/RCeA_to_RCS_Plane_withperiREZandTLBlock/fdt_paths.nii.gz -thr ${thr7t_rcea[${a}]} $DIR/${i}/probtrackx_7T/R/RCeA_to_RCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz

	#Right RCS-CeA	
		fslmaths $DIR/${i}/probtrackx_7T/R/RCS_Plane_to_RCeA_withperiREZandTLBlock/fdt_paths.nii.gz -thr 32 $DIR/${i}/probtrackx_7T/R/RCS_Plane_to_RCeA_withperiREZandTLBlock/fdt_paths_thr.nii.gz

	#Right BLAT-RCS	
		fslmaths $DIR/${i}/probtrackx_7T/R/RBLAT_to_RCS_Plane_withperiREZandTLBlock/fdt_paths.nii.gz -thr ${thr7t_rblat[${a}]} $DIR/${i}/probtrackx_7T/R/RBLAT_to_RCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz

	#Right RCS-BLAT	
		fslmaths $DIR/${i}/probtrackx_7T/R/RCS_Plane_to_RBLAT_withperiREZandTLBlock/fdt_paths.nii.gz -thr 32 $DIR/${i}/probtrackx_7T/R/RCS_Plane_to_RBLAT_withperiREZandTLBlock/fdt_paths_thr.nii.gz

	#Left CeA-LCS	
		fslmaths $DIR/${i}/probtrackx_7T/L/LCeA_to_LCS_Plane_withperiREZandTLBlock/fdt_paths.nii.gz -thr ${thr7t_lcea[${a}]} $DIR/${i}/probtrackx_7T/L/LCeA_to_LCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz

	#Left LCS-CeA	
		fslmaths $DIR/${i}/probtrackx_7T/L/LCS_Plane_to_LCeA_withperiREZandTLBlock/fdt_paths.nii.gz -thr 32 $DIR/${i}/probtrackx_7T/L/LCS_Plane_to_LCeA_withperiREZandTLBlock/fdt_paths_thr.nii.gz

	#Left BLAT-LCS	
		fslmaths $DIR/${i}/probtrackx_7T/L/LBLAT_to_LCS_Plane_withperiREZandTLBlock/fdt_paths.nii.gz -thr ${thr7t_lblat[${a}]} $DIR/${i}/probtrackx_7T/L/LBLAT_to_LCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz
		
	#Left LCS-BLAT	
		fslmaths $DIR/${i}/probtrackx_7T/L/LCS_Plane_to_LBLAT_withperiREZandTLBlock/fdt_paths.nii.gz -thr 32 $DIR/${i}/probtrackx_7T/L/LCS_PLane_to_LBLAT_withperiREZandTLBlock/fdt_paths_thr.nii.gz

#Sum and average the _thr tracts in diff space

	#Right CeA-REZ	
		fslmaths $DIR/${i}/probtrackx_7T/R/RCeA_to_RCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz -add $DIR/${i}/probtrackx_7T/R/RCS_Plane_to_RCeA_withperiREZandTLBlock/fdt_paths_thr.nii.gz $DIR/${i}/probtrackx_7T/R/R-CeA-CS_sum_periREZandTLBlock
		fslmaths $DIR/${i}/probtrackx_7T/R/R-CeA-CS_sum_periREZandTLBlock -div 2 $DIR/${i}/probtrackx_7T/R/R-CeA-CS_avg_periREZandTLBlock

	#Right BLAT-REZ	
		fslmaths $DIR/${i}/probtrackx_7T/R/RBLAT_to_RCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz -add $DIR/${i}/probtrackx_7T/R/RCS_Plane_to_RBLAT_withperiREZandTLBlock/fdt_paths_thr.nii.gz $DIR/${i}/probtrackx_7T/R/R-BLAT-CS_sum_periREZandTLBlock
		fslmaths $DIR/${i}/probtrackx_7T/R/R-BLAT-CS_sum_periREZandTLBlock -div 2 $DIR/${i}/probtrackx_7T/R/R-BLAT-CS_avg_periREZandTLBlock

	#Left CeA-REZ	
		fslmaths $DIR/${i}/probtrackx_7T/L/LCeA_to_LCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz -add $DIR/${i}/probtrackx_7T/L/LCS_Plane_to_LCeA_withperiREZandTLBlock/fdt_paths_thr.nii.gz $DIR/${i}/probtrackx_7T/L/L-CeA-CS_sum_periREZandTLBlock
		fslmaths $DIR/${i}/probtrackx_7T/L/L-CeA-CS_sum_periREZandTLBlock -div 2 $DIR/${i}/probtrackx_7T/L/L-CeA-CS_avg_periREZandTLBlock

	#Right BLAT-REZ	
		fslmaths $DIR/${i}/probtrackx_7T/L/LBLAT_to_LCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz -add $DIR/${i}/probtrackx_7T/L/LCS_Plane_to_LBLAT_withperiREZandTLBlock/fdt_paths_thr.nii.gz $DIR/${i}/probtrackx_7T/L/L-BLAT-CS_sum_periREZandTLBlock
		fslmaths $DIR/${i}/probtrackx_7T/L/L-BLAT-CS_sum_periREZandTLBlock -div 2 $DIR/${i}/probtrackx_7T/L/L-BLAT-CS_avg_periREZandTLBlock

#Transformation from DWI to MNI space using FLIRT (to 1mm MNI brain)

		/Users/moayedilab/fsl/bin/flirt \
			-in $DIR/${i}/probtrackx_7T/R/R-CeA-CS_avg_periREZandTLBlock \
			-applyxfm \
			-init $DIR/${i}/anat/7tdiff2standard1mm.mat \
			-out $DIR/${i}_RCeA-RCS.nii.gz \
			-paddingsize 0.0 -interp trilinear -ref /Users/moayedilab/fsl/data/standard/MNI152_T1_1mm_brain.nii.gz

		fslmaths \
			$DIR/${i}_RCeA-RCS.nii.gz \
			-thr 0.5 -bin \
			$DIR/${i}_RCeA-RCS.nii.gz

 	#Right BLAT-REZ	
		/Users/moayedilab/fsl/bin/flirt \
			-in $DIR/${i}/probtrackx_7T/R/R-BLAT-CS_avg_periREZandTLBlock \
			-applyxfm \
			-init $DIR/${i}/anat/7tdiff2standard1mm.mat \
			-out $DIR/${i}_RBLAT-RCS.nii.gz \
			-paddingsize 0.0 -interp trilinear -ref /Users/moayedilab/fsl/data/standard/MNI152_T1_1mm_brain.nii.gz

		fslmaths \
			$DIR/${i}_RBLAT-RCS.nii.gz \
			-thr 0.5 -bin \
			$DIR/${i}_RBLAT-RCS.nii.gz

 	#Left CeA-REZ	
		/Users/moayedilab/fsl/bin/flirt \
			-in $DIR/${i}/probtrackx_7T/L/L-CeA-CS_avg_periREZandTLBlock \
			-applyxfm \
			-init $DIR/${i}/anat/7tdiff2standard1mm.mat \
			-out $DIR/${i}_LCeA-LCS.nii.gz \
			-paddingsize 0.0 -interp trilinear -ref /Users/moayedilab/fsl/data/standard/MNI152_T1_1mm_brain.nii.gz

		fslmaths \
			$DIR/${i}_LCeA-LCS.nii.gz \
			-thr 0.5 -bin \
			$DIR/${i}_LCeA-LCS.nii.gz

 	#Left BLAT-REZ	
		/Users/moayedilab/fsl/bin/flirt \
			-in $DIR/${i}/probtrackx_7T/L/L-BLAT-CS_avg_periREZandTLBlock \
			-applyxfm \
			-init $DIR/${i}/anat/7tdiff2standard1mm.mat \
			-out $DIR/${i}_LBLAT-LCS.nii.gz \
			-paddingsize 0.0 -interp trilinear -ref /Users/moayedilab/fsl/data/standard/MNI152_T1_1mm_brain.nii.gz

		fslmaths \
			$DIR/${i}_LBLAT-LCS.nii.gz \
			-thr 0.5 -bin \
			$DIR/${i}_LBLAT-LCS.nii.gz
			
 	echo "7T-Subject ${i} done!"

 	
#3T

b=-1
b=$((b+1))

#Threshold fdt_paths images (10000*.0002*Number of voxels in the origin seed; grab the thr value from the corresponding arrays defined earlier in the script) for the circuit of interest & control circuit in native DWI space

#  #DWI Space First

# 	#Right CeA-RCS	
 		fslmaths $DIR/${i}/probtrackx_3T/R/RCeA_to_RCS_Plane_withperiREZandTLBlock/fdt_paths.nii.gz -thr ${thr3t_rcea[${b}]} $DIR/${i}/probtrackx_3T/R/RCeA_to_RCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz

# 	#Right RCS-CeA	
 		fslmaths $DIR/${i}/probtrackx_3T/R/RCS_Plane_to_RCeA_withperiREZandTLBlock/fdt_paths.nii.gz -thr 32 $DIR/${i}/probtrackx_3T/R/RCS_Plane_to_RCeA_withperiREZandTLBlock/fdt_paths_thr.nii.gz

# 	#Right BLAT-RCS	
 		fslmaths $DIR/${i}/probtrackx_3T/R/RBLAT_to_RCS_Plane_withperiREZandTLBlock/fdt_paths.nii.gz -thr ${thr3t_rblat[${b}]} $DIR/${i}/probtrackx_3T/R/RBLAT_to_RCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz

# 	#Right RCS-BLAT	
 		fslmaths $DIR/${i}/probtrackx_3T/R/RCS_Plane_to_RBLAT_withperiREZandTLBlock/fdt_paths.nii.gz -thr 32 $DIR/${i}/probtrackx_3T/R/RCS_Plane_to_RBLAT_withperiREZandTLBlock/fdt_paths_thr.nii.gz

# 	#Left CeA-LCS	
 		fslmaths $DIR/${i}/probtrackx_3T/L/LCeA_to_LCS_Plane_withperiREZandTLBlock/fdt_paths.nii.gz -thr ${thr3t_lcea[${b}]} $DIR/${i}/probtrackx_3T/L/LCeA_to_LCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz

# 	#Left LCS-CeA	
 		fslmaths $DIR/${i}/probtrackx_3T/L/LCS_Plane_to_LCeA_withperiREZandTLBlock/fdt_paths.nii.gz -thr 32 $DIR/${i}/probtrackx_3T/L/LCS_Plane_to_LCeA_withperiREZandTLBlock/fdt_paths_thr.nii.gz

# 	#Left BLAT-LCS	
 		fslmaths $DIR/${i}/probtrackx_3T/L/LBLAT_to_LCS_Plane_withperiREZandTLBlock/fdt_paths.nii.gz -thr ${thr3t_lblat[${b}]} $DIR/${i}/probtrackx_3T/L/LBLAT_to_LCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz
		
# 	#Left LCS-BLAT	
 		fslmaths $DIR/${i}/probtrackx_3T/L/LCS_Plane_to_LBLAT_withperiREZandTLBlock/fdt_paths.nii.gz -thr 32 $DIR/${i}/probtrackx_3T/L/LCS_PLane_to_LBLAT_withperiREZandTLBlock/fdt_paths_thr.nii.gz

# # #Sum and average the _thr tracts in diff space

# # 	#Right CeA-REZ	
 		fslmaths $DIR/${i}/probtrackx_3T/R/RCeA_to_RCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz -add $DIR/${i}/probtrackx_3T/R/RCS_Plane_to_RCeA_withperiREZandTLBlock/fdt_paths_thr.nii.gz $DIR/${i}/probtrackx_3T/R/R-CeA-CS_sum_periREZandTLBlock
 		fslmaths $DIR/${i}/probtrackx_3T/R/R-CeA-CS_sum_periREZandTLBlock -div 2 $DIR/${i}/probtrackx_3T/R/R-CeA-CS_avg_periREZandTLBlock

# 	#Right BLAT-REZ	
 		fslmaths $DIR/${i}/probtrackx_3T/R/RBLAT_to_RCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz -add $DIR/${i}/probtrackx_3T/R/RCS_Plane_to_RBLAT_withperiREZandTLBlock/fdt_paths_thr.nii.gz $DIR/${i}/probtrackx_3T/R/R-BLAT-CS_sum_periREZandTLBlock
 		fslmaths $DIR/${i}/probtrackx_3T/R/R-BLAT-CS_sum_periREZandTLBlock -div 2 $DIR/${i}/probtrackx_3T/R/R-BLAT-CS_avg_periREZandTLBlock

# 	#Left CeA-REZ	
 		fslmaths $DIR/${i}/probtrackx_3T/L/LCeA_to_LCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz -add $DIR/${i}/probtrackx_3T/L/LCS_Plane_to_LCeA_withperiREZandTLBlock/fdt_paths_thr.nii.gz $DIR/${i}/probtrackx_3T/L/L-CeA-CS_sum_periREZandTLBlock
 		fslmaths $DIR/${i}/probtrackx_3T/L/L-CeA-CS_sum_periREZandTLBlock -div 2 $DIR/${i}/probtrackx_3T/L/L-CeA-CS_avg_periREZandTLBlock

# 	#Right BLAT-REZ	
 		fslmaths $DIR/${i}/probtrackx_3T/L/LBLAT_to_LCS_Plane_withperiREZandTLBlock/fdt_paths_thr.nii.gz -add $DIR/${i}/probtrackx_3T/L/LCS_Plane_to_LBLAT_withperiREZandTLBlock/fdt_paths_thr.nii.gz $DIR/${i}/probtrackx_3T/L/L-BLAT-CS_sum_periREZandTLBlock
		fslmaths $DIR/${i}/probtrackx_3T/L/L-BLAT-CS_sum_periREZandTLBlock -div 2 $DIR/${i}/probtrackx_3T/L/L-BLAT-CS_avg_periREZandTLBlock

# # #Transformation from DWI to MNI space using FLIRT (to 1mm MNI brain)

		/Users/moayedilab/fsl/bin/flirt \
			-in $DIR/${i}/probtrackx_3T/R/R-CeA-CS_avg_periREZandTLBlock \
			-applyxfm \
			-init $DIR/${i}/anat/3tdiff2standard1mm.mat \
			-out $DIR/${i}_RCeA-RCS.nii.gz \
			-paddingsize 0.0 -interp trilinear -ref /Users/moayedilab/fsl/data/standard/MNI152_T1_1mm_brain.nii.gz

		fslmaths \
			$DIR/${i}_RCeA-RCS.nii.gz \
			-thr 0.5 -bin \
			$DIR/${i}_RCeA-RCS.nii.gz

# 	#Right BLAT-REZ	
		/Users/moayedilab/fsl/bin/flirt \
			-in $DIR/${i}/probtrackx_3T/R/R-BLAT-CS_avg_periREZandTLBlock \
			-applyxfm \
			-init $DIR/${i}/anat/3tdiff2standard1mm.mat \
			-out $DIR/${i}_RBLAT-RCS.nii.gz \
			-paddingsize 0.0 -interp trilinear -ref /Users/moayedilab/fsl/data/standard/MNI152_T1_1mm_brain.nii.gz

		fslmaths \
			$DIR/${i}_RBLAT-RCS.nii.gz \
			-thr 0.5 -bin \
			$DIR/${i}_RBLAT-RCS.nii.gz

# 	#Left CeA-REZ	
		/Users/moayedilab/fsl/bin/flirt \
			-in $DIR/${i}/probtrackx_3T/L/L-CeA-CS_avg_periREZandTLBlock \
			-applyxfm \
			-init $DIR/${i}/anat/3tdiff2standard1mm.mat \
			-out $DIR/${i}_LCeA-LCS.nii.gz \
			-paddingsize 0.0 -interp trilinear -ref /Users/moayedilab/fsl/data/standard/MNI152_T1_1mm_brain.nii.gz

		fslmaths \
			$DIR/${i}_LCeA-LCS.nii.gz \
			-thr 0.5 -bin \
			$DIR/${i}_LCeA-LCS.nii.gz

# 	#Left BLAT-REZ	
		/Users/moayedilab/fsl/bin/flirt \
			-in $DIR/${i}/probtrackx_3T/L/L-BLAT-CS_avg_periREZandTLBlock \
			-applyxfm \
			-init $DIR/${i}/anat/3tdiff2standard1mm.mat \
			-out $DIR/${i}_LBLAT-LCS.nii.gz \
			-paddingsize 0.0 -interp trilinear -ref /Users/moayedilab/fsl/data/standard/MNI152_T1_1mm_brain.nii.gz

		fslmaths \
			$DIR/${i}_LBLAT-LCS.nii.gz \
			-thr 0.5 -bin \
			$DIR/${i}_LBLAT-LCS.nii.gz

echo "3T-Subject ${i} done!"

done