#!/bin/sh

#Author: Batu Kaya
#Publication: Kaya et al. 2025, Imaging Neuroscience, https://doi.org/10.1162/imag_a_00567

DIR=#Set study directory here

#Populate the for loop with the subject IDs. bedpostx was run prior to probtrackx.

for i in ... ; do 

	#Add the PAG and 5M to individually drawn exclusion planes and save as a NEW image
		fslmaths $DIR/${i}/diff_Masks_7T/Plane_Exclusion.nii.gz -add $DIR/${i}/diff_Masks_7T/PAG.nii.gz -add $DIR/${i}/diff_Masks_7T/R_5M.nii.gz -add $DIR/${i}/diff_Masks_7T/periREZ.nii.gz -add $DIR/${i}/diff_Masks_7T/TL_Block.nii.gz -add $DIR/${i}/diff_Masks_7T/L_5M.nii.gz $DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandperiREZandTLBlock.nii.gz
		fslmaths $DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandperiREZandTLBlock.nii.gz -bin $DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandperiREZandTLBlock.nii.gz

	#Add the CeA seeds to the PAG exclusion planes and save as a NEW image for the control circuits
		fslmaths $DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandperiREZandTLBlock.nii.gz -add $DIR/${i}/diff_Masks_7T/R_CeA -add $DIR/${i}/diff_Masks_7T/L_CeA $DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandCeAandperiREZandTLBlock.nii.gz
		fslmaths $DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandCeAandperiREZandTLBlock.nii.gz -bin $DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandCeAandperiREZandTLBlock.nii.gz

	#Add the BLAT seeds to the PAG exclusion planes and save as a NEW image for the control circuits
		fslmaths $DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandperiREZandTLBlock.nii.gz -add $DIR/${i}/diff_Masks_7T/R_BLAT -add $DIR/${i}/diff_Masks_7T/L_BLAT $DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandBLATandperiREZandTLBlock.nii.gz
		fslmaths $DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandBLATandperiREZandTLBlock.nii.gz -bin $DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandBLATandperiREZandTLBlock.nii.gz

#Tractography: Circuit of Interest: CeA <===> CNV REZ !!!!! NO PAG (added to the exclusion mask) !!!!

# 	#R_REZ_to_R_CeA  
	    probtrackx2 \
	    	-x $DIR/${i}/diff_Masks_7T/R_CS_Plane.nii.gz \
	    	-l \
	    	--modeuler \
	    	--wayorder \
	    	--pd \
	    	-c 0.1 \
	    	-S 2000 \
	    	--steplength=0.5 \
	    	-P 10000 \
	    	--fibthresh=0.01 \
	    	--distthresh=0.0 \
	    	--sampvox=0.0 \
	    	--avoid=$DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandBLATandperiREZandTLBlock.nii.gz \
	    	--stop=$DIR/${i}/diff_Masks_7T/R_CeA.nii.gz \
	    	--forcedir \
	    	--opd \
	    	-s $DIR/${i}/Diffusion_7T.bedpostX/merged \
	    	-m $DIR/${i}/Diffusion_7T.bedpostX/nodif_brain_mask \
	    	--dir=$DIR/${i}/probtrackx_7T/R/RCS_Plane_to_RCeA_withperiREZandTLBlock \
	    	--waypoints=$DIR/${i}/diff_Masks_7T/R_REZ.nii.gz \
	    	--waypoints=$DIR/${i}/diff_Masks_7T/R_PBL.nii.gz \
	    	--waypoints=$DIR/${i}/diff_Masks_7T/R_CeA.nii.gz \
	    	--waycond=AND 

	#R_CeA_to_R_REZ
		probtrackx2 \
			-x $DIR/${i}/diff_Masks_7T/R_CeA.nii.gz \
			-l \
			--modeuler \
			--wayorder \
			--pd \
			-c 0.1 \
			-S 2000 \
			--steplength=0.5 \
			-P 10000 \
			--fibthresh=0.01 \
			--distthresh=0.0 \
			--sampvox=0.0 \
			--avoid=$DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandBLATandperiREZandTLBlock.nii.gz \
			--stop=$DIR/${i}/diff_Masks_7T/R_CS_Plane.nii.gz \
			--forcedir \
			--opd \
			-s $DIR/${i}/Diffusion_7T.bedpostX/merged \
			-m $DIR/${i}/Diffusion_7T.bedpostX/nodif_brain_mask \
			--dir=$DIR/${i}/probtrackx_7T//R/RCeA_to_RCS_Plane_withperiREZandTLBlock \
			--waypoints=$DIR/${i}/diff_Masks_7T/R_PBL.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/R_REZ.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/R_CS_Plane.nii.gz \
			--waycond=AND 

	#L_REZ_to_L_CeA  
		probtrackx2 \
			-x $DIR/${i}/diff_Masks_7T/L_CS_Plane.nii.gz \
			-l \
			--modeuler \
			--wayorder \
			--pd \
			-c 0.1 \
			-S 2000 \
			--steplength=0.5 \
			-P 10000 \
			--fibthresh=0.01 \
			--distthresh=0.0 \
			--sampvox=0.0 \
			--avoid=$DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandBLATandperiREZandTLBlock.nii.gz \
			--stop=$DIR/${i}/diff_Masks_7T/L_CeA.nii.gz \
			--forcedir \
			--opd \
			-s $DIR/${i}/Diffusion_7T.bedpostX/merged \
			-m $DIR/${i}/Diffusion_7T.bedpostX/nodif_brain_mask \
			--dir=$DIR/${i}/probtrackx_7T/L/LCS_Plane_to_LCeA_withperiREZandTLBlock \
			--waypoints=$DIR/${i}/diff_Masks_7T/L_REZ.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/L_PBL.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/L_CeA.nii.gz \
			--waycond=AND 

	#L_CeA_to_L_REZ
		probtrackx2 \
			-x $DIR/${i}/diff_Masks_7T/L_CeA.nii.gz \
			-l \
			--modeuler \
			--wayorder \
			--pd \
			-c 0.1 \
			-S 2000 \
			--steplength=0.5 \
			-P 10000 \
			--fibthresh=0.01 \
			--distthresh=0.0 \
			--sampvox=0.0 \
			--avoid=$DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandBLATandperiREZandTLBlock.nii.gz \
			--stop=$DIR/${i}/diff_Masks_7T/L_CS_Plane.nii.gz \
			--forcedir \
			--opd \
			-s $DIR/${i}/Diffusion_7T.bedpostX/merged \
			-m $DIR/${i}/Diffusion_7T.bedpostX/nodif_brain_mask \
			--dir=$DIR/${i}/probtrackx_7T/L/LCeA_to_LCS_Plane_withperiREZandTLBlock \
			--waypoints=$DIR/${i}/diff_Masks_7T/L_PBL.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/L_REZ.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/L_CS_Plane.nii.gz \
			--waycond=AND 

#Tractography: Control Circuit 2: BLAT <===> CNV REZ !!!!! NO PAG (added to the exclusion mask) !!!!

	#R_REZ_to_R_BLAT  
		 probtrackx2 \
		 	-x $DIR/${i}/diff_Masks_7T/R_CS_Plane.nii.gz \
		 	-l \
		 	--modeuler \
		 	--wayorder \
		 	--pd \
		 	-c 0.1 \
		 	-S 2000 \
		 	--steplength=0.5 \
		 	-P 10000 \
		 	--fibthresh=0.01 \
		 	--distthresh=0.0 \
		 	--sampvox=0.0 \
		 	--avoid=$DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandCeAandperiREZandTLBlock.nii.gz \
		 	--stop=$DIR/${i}/diff_Masks_7T/R_BLAT.nii.gz \
		 	--forcedir \
		 	--opd \
		 	-s $DIR/${i}/Diffusion_7T.bedpostX/merged \
		 	-m $DIR/${i}/Diffusion_7T.bedpostX/nodif_brain_mask \
		 	--dir=$DIR/${i}/probtrackx_7T/R/RCS_Plane_to_RBLAT_withperiREZandTLBlock \
		 	--waypoints=$DIR/${i}/diff_Masks_7T/R_REZ.nii.gz \
		 	--waypoints=$DIR/${i}/diff_Masks_7T/R_PBL.nii.gz \
		 	--waypoints=$DIR/${i}/diff_Masks_7T/R_BLAT.nii.gz \
		 	--waycond=AND 

	#R_BLAT_to_R_REZ
		probtrackx2 \
			-x $DIR/${i}/diff_Masks_7T/R_BLAT.nii.gz \
			-l \
			--modeuler \
			--wayorder \
			--pd \
			-c 0.1 \
			-S 2000 \
			--steplength=0.5 \
			-P 10000 \
			--fibthresh=0.01 \
			--distthresh=0.0 \
			--sampvox=0.0 \
			--avoid=$DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandCeAandperiREZandTLBlock.nii.gz \
			--stop=$DIR/${i}/diff_Masks_7T/R_CS_Plane.nii.gz \
			--forcedir \
			--opd \
			-s $DIR/${i}/Diffusion_7T.bedpostX/merged \
			-m $DIR/${i}/Diffusion_7T.bedpostX/nodif_brain_mask \
			--dir=$DIR/${i}/probtrackx_7T/R/RBLAT_to_RCS_Plane_withperiREZandTLBlock \
			--waypoints=$DIR/${i}/diff_Masks_7T/R_PBL.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/R_REZ.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/R_CS_Plane.nii.gz \
			--waycond=AND 

	#L_REZ_to_L_BLAT  
		probtrackx2 \
			-x $DIR/${i}/diff_Masks_7T/L_CS_Plane.nii.gz \
			-l \
			--modeuler \
			--wayorder \
			--pd \
			-c 0.1 \
			-S 2000 \
			--steplength=0.5 \
			-P 10000 \
			--fibthresh=0.01 \
			--distthresh=0.0 \
			--sampvox=0.0 \
			--avoid=$DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandCeAandperiREZandTLBlock.nii.gz \
			--stop=$DIR/${i}/diff_Masks_7T/L_BLAT.nii.gz \
			--forcedir \
			--opd \
			-s $DIR/${i}/Diffusion_7T.bedpostX/merged \
			-m $DIR/${i}/Diffusion_7T.bedpostX/nodif_brain_mask \
			--dir=$DIR/${i}/probtrackx_7T/L/LCS_Plane_to_LBLAT_withperiREZandTLBlock \
			--waypoints=$DIR/${i}/diff_Masks_7T/L_REZ.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/L_PBL.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/L_BLAT.nii.gz \
			--waycond=AND 

	#L_BLAT_to_L_REZ
		probtrackx2 \
			-x $DIR/${i}/diff_Masks_7T/L_BLAT.nii.gz \
			-l \
			--modeuler \
			--wayorder \
			--pd \
			-c 0.1 \
			-S 2000 \
			--steplength=0.5 \
			-P 10000 \
			--fibthresh=0.01 \
			--distthresh=0.0 \
			--sampvox=0.0 \
			--avoid=$DIR/${i}/diff_Masks_7T/Plane_Exclusion_withPAGand5MandCeAandperiREZandTLBlock.nii.gz \
			--stop=$DIR/${i}/diff_Masks_7T/L_CS_Plane.nii.gz \
			--forcedir \
			--opd \
			-s $DIR/${i}/Diffusion_7T.bedpostX/merged \
			-m $DIR/${i}/Diffusion_7T.bedpostX/nodif_brain_mask \
			--dir=$DIR/${i}/probtrackx_7T/L/LBLAT_to_LCS_Plane_withperiREZandTLBlock \
			--waypoints=/$DIR/${i}/diff_Masks_7T/L_PBL.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/L_REZ.nii.gz \
			--waypoints=$DIR/${i}/diff_Masks_7T/L_CS_Plane.nii.gz \
			--waycond=AND 

		echo "Done Probtrackx for ${i}"
done