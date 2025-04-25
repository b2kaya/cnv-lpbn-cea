#!/bin/sh

#Author: Batu Kaya
#Publication: Kaya et al. 2025, Imaging Neuroscience, https://doi.org/10.1162/imag_a_00567

DIR=#Set study directory here

#Populate the for loop with the subject IDs

#This for loop writes the waytotal counts from the probtrackx directory into a text file. Then, the voxel count for the origin seed for each probtrackx run is written into a txt file. 
for i in ... ; do 

#Print out waytotal counts into txt files 

	# 7T
	# # #Left Tracts
		cat $DIR/${i}/probtrackx_7T/L/LCeA_to_LCS_Plane_withperiREZandTLBlock/waytotal >> $DIR/7T-LCeA_to_LCS_Plane_withperiREZandTLBlock_waytotals.txt 
		cat $DIR/${i}/probtrackx_7T/L/LCS_Plane_to_LCeA_withperiREZandTLBlock/waytotal >> $DIR/7T-LCS_Plane_to_LCeA_withperiREZandTLBlock_waytotals.txt 
		cat $DIR/${i}/probtrackx_7T/L/LBLAT_to_LCS_Plane_withperiREZandTLBlock/waytotal >> $DIR/7T-LBLAT_to_LCS_Plane_withperiREZandTLBlock_waytotals.txt
		cat $DIR/${i}/probtrackx_7T/L/LCS_Plane_to_LBLAT_withperiREZandTLBlock/waytotal >> $DIR/7T-LCS_Plane_to_LBLAT_withperiREZandTLBlock_waytotals.txt

	# # #Right Tracts
		cat $DIR/${i}/probtrackx_7T/R/RCeA_to_RCS_Plane_withperiREZandTLBlock/waytotal >> $DIR/7T-RCeA_to_RCS_Plane_withperiREZandTLBlock_waytotals.txt 
		cat $DIR/${i}/probtrackx_7T/R/RCS_Plane_to_RCeA_withperiREZandTLBlock/waytotal >> $DIR/7T-RCS_Plane_to_RCeA_withperiREZandTLBlock_waytotals.txt 
		cat $DIR/${i}/probtrackx_7T/R/RBLAT_to_RCS_Plane_withperiREZandTLBlock/waytotal >> $DIR/7T-RBLAT_to_RCS_Plane_withperiREZandTLBlock_waytotals.txt
		cat $DIR/${i}/probtrackx_7T/R/RCS_Plane_to_RBLAT_withperiREZandTLBlock/waytotal >> $DIR/7T-RCS_Plane_to_RBLAT_withperiREZandTLBlock_waytotals.txt

	#3T
	# #Left Tracts
		cat $DIR/${i}/probtrackx_3T/L/LCeA_to_LCS_Plane_withperiREZandTLBlock/waytotal >> $DIR/3T-LCeA_to_LCS_Plane_withperiREZandTLBlock_waytotals.txt 
		cat $DIR/${i}/probtrackx_3T/L/LCS_Plane_to_LCeA_withperiREZandTLBlock/waytotal >> $DIR/3T-LCS_Plane_to_LCeA_withperiREZandTLBlock_waytotals.txt 
		cat $DIR/${i}/probtrackx_3T/L/LBLAT_to_LCS_Plane_withperiREZandTLBlock/waytotal >> $DIR/3T-LBLAT_to_LCS_Plane_withperiREZandTLBlock_waytotals.txt
		cat $DIR/${i}/probtrackx_3T/L/LCS_Plane_to_LBLAT_withperiREZandTLBlock/waytotal >> $DIR/3T-LCS_Plane_to_LBLAT_withperiREZandTLBlock_waytotals.txt

	# #Right Tracts
		cat $DIR/${i}/probtrackx_3T/R/RCeA_to_RCS_Plane_withperiREZandTLBlock/waytotal >> $DIR/3T-RCeA_to_RCS_Plane_withperiREZandTLBlock_waytotals.txt 
		cat $DIR/${i}/probtrackx_3T/R/RCS_Plane_to_RCeA_withperiREZandTLBlock/waytotal >> $DIR/3T-RCS_Plane_to_RCeA_withperiREZandTLBlock_waytotals.txt 
		cat $DIR/${i}/probtrackx_3T/R/RBLAT_to_RCS_Plane_withperiREZandTLBlock/waytotal >> $DIR/3T-RBLAT_to_RCS_Plane_withperiREZandTLBlock_waytotals.txt
		cat $DIR/${i}/probtrackx_3T/R/RCS_Plane_to_RBLAT_withperiREZandTLBlock/waytotal >> $DIR/3T-RCS_Plane_to_RBLAT_withperiREZandTLBlock_waytotals.txt

#Print out voxel sizes for the origin seeds (REZ, CeA, BLAT) and CS Plane seed voxal counts into txt files 
	fslstats $DIR/${i}/diff_Masks_3T/R_REZ.nii.gz -V >> $DIR/3T-voxelcount_RREZ.txt
	fslstats $DIR/${i}/diff_Masks_3T/L_REZ.nii.gz -V >> $DIR/3T-voxelcount_LREZ.txt
	fslstats $DIR/${i}/diff_Masks_3T/R_CS_Plane.nii.gz -V >> $DIR/3T-voxelcount_R_CS_Plane.txt
	fslstats $DIR/${i}/diff_Masks_3T/L_CS_Plane.nii.gz -V >> $DIR/3T-voxelcount_L_CS_Plane.txt
	fslstats $DIR/${i}/diff_Masks_3T/R_CeA.nii.gz -V >> $DIR/3T-voxelcount_R_CeA.txt
	fslstats $DIR/${i}/diff_Masks_3T/L_CeA.nii.gz -V >> $DIR/3T-voxelcount_L_CeA.txt
	fslstats $DIR/${i}/diff_Masks_3T/R_BLAT.nii.gz -V >> $DIR/3T-voxelcount_R_BLAT.txt
	fslstats $DIR/${i}/diff_Masks_3T/L_BLAT.nii.gz -V >> $DIR/3T-voxelcount_L_BLAT.txt
	
#Print out voxel sizes for the origin seeds (REZ, CeA, BLAT) and CS Plane seed voxal counts into txt files 
	fslstats $DIR/${i}/diff_Masks_7T/R_REZ.nii.gz -V >> $DIR/7T-voxelcount_RREZ.txt
	fslstats $DIR/${i}/diff_Masks_7T/L_REZ.nii.gz -V >> $DIR/7T-voxelcount_LREZ.txt
	fslstats $DIR/${i}/diff_Masks_7T/R_CS_Plane.nii.gz -V >> $DIR/7T-voxelcount_R_CS_Plane.txt
	fslstats $DIR/${i}/diff_Masks_7T/L_CS_Plane.nii.gz -V >> $DIR/7T-voxelcount_L_CS_Plane.txt
	fslstats $DIR/${i}/diff_Masks_7T/R_CeA.nii.gz -V >> $DIR/7T-voxelcount_R_CeA.txt
	fslstats $DIR/${i}/diff_Masks_7T/L_CeA.nii.gz -V >> $DIR/7T-voxelcount_L_CeA.txt
	fslstats $DIR/${i}/diff_Masks_7T/R_BLAT.nii.gz -V >> $DIR/7T-voxelcount_R_BLAT.txt
	fslstats $DIR/${i}/diff_Masks_7T/L_BLAT.nii.gz -V >> $DIR/7T-voxelcount_L_BLAT.txt

done