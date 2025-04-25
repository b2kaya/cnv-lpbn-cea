#!/bin/sh

#Author: Batu Kaya
#Publication: Kaya et al. 2025, Imaging Neuroscience, https://doi.org/10.1162/imag_a_00567

DIR=#Set study directory here

 export FREESURFER_HOME=/Applications/freesurfer/7.4.1
 source $FREESURFER_HOME/SetUpFreeSurfer.sh

#Populate the for loop with the subject IDs

for i in ... ; do 

#Skull Stripping#

 	#Skull stripping the T1 using freesurfer's mri_synthstrip
 		mri_synthstrip \
 			 -i $DIR/${i}/anat/${i}_T1.nii.gz \
 			 -o $DIR/${i}/anat/${i}_T1_brain.nii.gz \
 			 -m $DIR/${i}/anat/${i}_T1_brain_mask.nii.gz \

#Skull stripping the dMRI at 3T using freesurfer's mri_synthstrip
 		  fslroi $DIR/${i}/Diffusion_3T/data.nii.gz $DIR/${i}/Diffusion_3T/${i}_nodif.nii.gz 0 1

 		  mri_synthstrip \
 		  	-i $DIR/${i}/Diffusion_3T/${i}_nodif.nii.gz \
 		  	-o $DIR/${i}/Diffusion_3T/${i}_nodif_brain.nii.gz \
 		  	-m $DIR/${i}/Diffusion_3T/${i}_nodif_brain_mask.nii.gz \

  		 cp $DIR/${i}/Diffusion_3T/${i}_nodif_brain_mask.nii.gz $DIR/${i}/Diffusion_3T/nodif_brain_mask.nii.gz

#Skull stripping the dMRI at 7T using freesurfer's mri_synthstrip
	  	 fslroi $DIR/${i}/Diffusion_7T/data.nii.gz $DIR/${i}/Diffusion_7T/${i}_nodif.nii.gz 0 1

	  	 mri_synthstrip \
	  	 	-i $DIR/${i}/Diffusion_7T/${i}_nodif.nii.gz \
	 	 	 -o $DIR/${i}/Diffusion_7T/${i}_nodif_brain.nii.gz \
	  	 	-m $DIR/${i}/Diffusion_7T/${i}_nodif_brain_mask.nii.gz\

  	  cp $DIR/${i}/Diffusion_7T/${i}_nodif_brain_mask.nii.gz $DIR/${i}/Diffusion_7T/nodif_brain_mask.nii.gz

#Registration (Linear)

# 	FLIRT: Reg to the MNI 1mm standard brain

# 		T1w  (0.7 mm) > MNI (1mm)
 		 /Applications/fsl/bin/flirt \
 		   -in $DIR/${i}/anat/${i}_T1_brain.nii.gz  \
 		 	 -ref /Applications/fsl/data/standard/MNI152_T1_1mm_brain \
 		 	 -omat $DIR/${i}/anat/struct2standard1mm.mat \
 		 	 -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12

# 		# # #DWI (7T-1.05 mm) > T1w (0.7 mm)
		  /Applications/fsl/bin/flirt \
		  	-in $DIR/${i}/Diffusion_7T/${i}_nodif_brain.nii.gz \
		  	-ref $DIR/${i}/anat/${i}_T1_brain.nii.gz \
		  	-omat $DIR/${i}/anat/7Tdiff2struct.mat \
		  	-bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12

#		# # # #DWI (3T-1.25 mm) > T1w (0.7 mm)
 		  /Applications/fsl/bin/flirt \
  		  	-in $DIR/${i}/Diffusion_3T/${i}_nodif_brain.nii.gz \
  		  	-ref $DIR/${i}/anat/${i}_T1_brain.nii.gz \
  		  	-omat $DIR/${i}/anat/3Tdiff2struct.mat \
  		  	-bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12

# # 		# # # #DWI (3T-1.25 mm) > MNI (1mm)
  		  /Applications/fsl/bin/convert_xfm \
  		  	-omat $DIR/${i}/anat/3tdiff2standard1mm.mat \
  		  	-concat $DIR/${i}/anat/3Tdiff2struct.mat $DIR/${i}/anat/struct2standard1mm.mat
               
# 		# #DWI (7T-1.05 mm) > MNI (1mm)
		  /Applications/fsl/bin/convert_xfm \
		  	-omat $DIR/${i}/anat/7tdiff2standard1mm.mat \
		  	-concat $DIR/${i}/anat/7Tdiff2struct.mat $DIR/${i}/anat/struct2standard1mm.mat

#  FLIRT: Reg to the MNI 2mm standard brain

# 		# # # #T1w  (0.7 mm) > MNI (2mm)
 		 /Applications/fsl/bin/flirt \
 		  	 -in $DIR/${i}/anat/${i}_T1_brain.nii.gz  \
 		 	 -ref /Applications/fsl/data/standard/MNI152_T1_2mm_brain \
 		 	 -omat $DIR/${i}/anat/struct2standard2mm.mat \
 		 	 -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12
# 		#DWI (3T-1.25 mm) > MNI (2mm)
   		/Applications/fsl/bin/convert_xfm \
   			-omat $DIR/${i}/anat/3tdiff2standard2mm.mat \
   			-concat $DIR/${i}/anat/3Tdiff2struct.mat $DIR/${i}/anat/struct2standard2mm.mat
# #  		#MNI (1mm) > (3T-1.25 mm)
   		/Applications/fsl/bin/convert_xfm -omat $DIR/${i}/anat/3tstandard1mm2diff.mat -inverse $DIR/${i}/anat/3tdiff2standard1mm.mat
# #  		#MNI (2mm) > (3T-1.25 mm)
   		/Applications/fsl/bin/convert_xfm -omat $DIR/${i}/anat/3tstandard2mm2diff.mat -inverse $DIR/${i}/anat/3tdiff2standard2mm.mat
#  		# #DWI (7T-1.05 mm) > MNI (2mm)
 		/Applications/fsl/bin/convert_xfm \
 			-omat $DIR/${i}/anat/7tdiff2standard2mm.mat \
 			-concat $DIR/${i}/anat/7Tdiff2struct.mat $DIR/${i}/anat/struct2standard2mm.mat
#  		#MNI (1mm) > (7T-1.05 mm)
 		/Applications/fsl/bin/convert_xfm -omat $DIR/${i}/anat/7tstandard1mm2diff.mat -inverse $DIR/${i}/anat/7tdiff2standard1mm.mat
#  		#MNI (2mm) > (7T-1.05 mm)
 		/Applications/fsl/bin/convert_xfm -omat $DIR/${i}/anat/7tstandard2mm2diff.mat -inverse $DIR/${i}/anat/7tdiff2standard2mm.mat

#Model the diffusion tensor using FSL's DTIFIT

    dtifit \
   -k $DIR/${i}/Diffusion_3T/data.nii.gz \
   -o $DIR/${i}/Diffusion_3T/dtifit \
   -m $DIR/${i}/Diffusion_3T/${i}_nodif_brain_mask.nii.gz \
   -r $DIR/${i}/Diffusion_3T/bvecs \
   -b $DIR/${i}/Diffusion_3T/bvals

   dtifit \
   -k $DIR/${i}/Diffusion_7T/data.nii.gz \
   -o $DIR/${i}/Diffusion_7T/dtifit \
   -m $DIR/${i}/Diffusion_7T/${i}_nodif_brain_mask.nii.gz \
   -r $DIR/${i}/Diffusion_7T/bvecs \
   -b $DIR/${i}/Diffusion_7T/bvals
   
#Resample ROIs from atlases#

#  #7T: Apply transformation matrices to bring masks in MNI 1mm space to subject diff space

#  	# #R_CeA Mask
   flirt \
 			-in $DIR/MNI_Masks/AMY/R_CEN_BIN_mask.nii.gz \
 			-applyxfm -init $DIR/${i}/anat/7tstandard1mm2diff.mat \
 			-out $DIR/${i}/diff_Masks_7T/R_CeA \
 			-paddingsize 0.0 -interp trilinear \
 			-ref $DIR/${i}/Diffusion_7T/${i}_nodif_brain.nii.gz
 	 fslmaths $DIR/${i}/diff_Masks_7T/R_CeA -thr 0.5 -bin $DIR/${i}/diff_Masks_7T/R_CeA

# # 	# #L_CeA Mask
  	 flirt \
  		 	-in $DIR/MNI_Masks/AMY/L_CEN_BIN_mask.nii.gz \
  		 	-applyxfm -init $DIR/${i}/anat/7tstandard1mm2diff.mat \
  		 	-out $DIR/${i}/diff_Masks_7T/L_CeA \
  		 	-paddingsize 0.0 -interp trilinear \
  		 	-ref $DIR/${i}/Diffusion_7T/${i}_nodif_brain.nii.gz
  	 	fslmaths $DIR/${i}/diff_Masks_7T/L_CeA -thr 0.5 -bin $DIR/${i}/diff_Masks_7T/L_CeA

# # 	# #R_BLAT Mask
 	flirt \
 			-in $DIR/MNI_Masks/AMY/R_BLAT_BIN_mask.nii.gz \
 			-applyxfm -init $DIR/${i}/anat/7tstandard1mm2diff.mat \
 			-out $DIR/${i}/diff_Masks_7T/R_BLAT \
 			-paddingsize 0.0 -interp trilinear \
 			-ref $DIR/${i}/Diffusion_7T/${i}_nodif_brain.nii.gz
 	 fslmaths $DIR/${i}/diff_Masks_7T/R_BLAT -thr 0.5 -bin $DIR/${i}/diff_Masks_7T/R_BLAT

# # 	# #L_BLAT Mask
  	 	flirt \
  		 	-in $DIR/MNI_Masks/AMY/L_BLAT_BIN_mask.nii.gz \
  		 	-applyxfm -init $DIR/${i}/anat/7tstandard1mm2diff.mat \
  		 	-out $DIR/${i}/diff_Masks_7T/L_BLAT \
  		 	-paddingsize 0.0 -interp trilinear \
  		 	-ref $DIR/${i}/Diffusion_7T/${i}_nodif_brain.nii.gz
  	 	fslmaths $DIR/${i}/diff_Masks_7T/L_BLAT -thr 0.5 -bin $DIR/${i}/diff_Masks_7T/L_BLAT

# # 	# #R_PBL Mask
  	 	flirt \
  	 		-in $DIR/MNI_Masks/PBL/LPB_r.nii.gz \
  	 		-applyxfm -init $DIR/${i}/anat/7tstandard1mm2diff.mat \
  	 		-out $DIR/${i}/diff_Masks_7T/R_PBL \
  	 		-paddingsize 0.0 -interp trilinear \
  	 		-ref $DIR/${i}/Diffusion_7T/${i}_nodif_brain.nii.gz
  	 	fslmaths $DIR/${i}/diff_Masks_7T/R_PBL -thr 0.5 -bin $DIR/${i}/diff_Masks_7T/R_PBL

# # 	# #L_PBL Mask
  	 	 flirt \
  	 	 	-in $DIR/MNI_Masks/PBL/LPB_l.nii.gz \
  	 	 	-applyxfm -init $DIR/${i}/anat/7tstandard1mm2diff.mat \
  	 	 	-out $DIR/${i}/diff_Masks_7T/L_PBL \
  	 	 	-paddingsize 0.0 -interp trilinear \
  	 	 	-ref $DIR/${i}/Diffusion_7T/${i}_nodif_brain.nii.gz
  	 	fslmaths $DIR/${i}/diff_Masks_7T/L_PBL -thr 0.5 -bin $DIR/${i}/diff_Masks_7T/L_PBL

# # 	# #R_5M
  		flirt \
  			-in $DIR/MNI_Masks/5M/MNI_R5M_50p.nii.gz \
  			-applyxfm -init $DIR/${i}/anat/7tstandard1mm2diff.mat \
  			-out $DIR/${i}/diff_Masks_7T/R_5M.nii.gz \
  			-paddingsize 0.0 -interp trilinear \
  			-ref $DIR/${i}/Diffusion_7T/${i}_nodif_brain.nii.gz
  		fslmaths $DIR/${i}/diff_Masks_7T/R_5M.nii.gz -thr 0.5 -bin $DIR/${i}/diff_Masks_7T/R_5M.nii.gz

# # 	# #L_5M
  		flirt \
  			-in $DIR/MNI_Masks/5M/MNI_L5M_50p.nii.gz \
  			-applyxfm -init $DIR/${i}/anat/7tstandard1mm2diff.mat \
  			-out $DIR/${i}/diff_Masks_7T/L_5M.nii.gz \
  			-paddingsize 0.0 -interp trilinear \
  			-ref $DIR/${i}/Diffusion_7T/${i}_nodif_brain.nii.gz
  		fslmaths $DIR/${i}/diff_Masks_7T/L_5M.nii.gz -thr 0.5 -bin $DIR/${i}/diff_Masks_7T/L_5M.nii.gz

# # 	# #PAG
  	 	flirt \
  	 		-in $DIR/MNI_Masks/PAG/PAG_50p.nii.gz \
  	 		-applyxfm -init $DIR/${i}/anat/7tstandard1mm2diff.mat \
  	 		-out $DIR/${i}/diff_Masks_7T/PAG.nii.gz \
  	 		-paddingsize 0.0 -interp trilinear \
  	 		-ref $DIR/${i}/Diffusion_7T/${i}_nodif_brain.nii.gz
  	 	fslmaths $DIR/${i}/diff_Masks_7T/PAG.nii.gz -thr 0.5 -bin $DIR/${i}/diff_Masks_7T/PAG.nii.gz

#  #3T: Apply transformation matrices to bring masks in MNI 1mm space to subject diff space

# # 	# #R_CeA Mask
      flirt \
 			-in $DIR/MNI_Masks/AMY/R_CEN_BIN_mask.nii.gz \
 			-applyxfm -init $DIR/${i}/anat/3tstandard1mm2diff.mat \
 			-out $DIR/${i}/diff_Masks_3T/R_CeA \
 			-paddingsize 0.0 -interp trilinear \
 			-ref $DIR/${i}/Diffusion_3T/${i}_nodif_brain.nii.gz
 	 	fslmaths $DIR/${i}/diff_Masks_3T/R_CeA -thr 0.5 -bin $DIR/${i}/diff_Masks_3T/R_CeA

# # 	# #L_CeA Mask
  	 flirt \
  		 	-in $DIR/MNI_Masks/AMY/L_CEN_BIN_mask.nii.gz \
  		 	-applyxfm -init $DIR/${i}/anat/3tstandard1mm2diff.mat \
  		 	-out $DIR/${i}/diff_Masks_3T/L_CeA \
  		 	-paddingsize 0.0 -interp trilinear \
  		 	-ref $DIR/${i}/Diffusion_3T/${i}_nodif_brain.nii.gz
  	 	fslmaths $DIR/${i}/diff_Masks_3T/L_CeA -thr 0.5 -bin $DIR/${i}/diff_Masks_3T/L_CeA

# # 	# #R_BLAT Mask
	flirt \
 			-in $DIR/MNI_Masks/AMY/R_BLAT_BIN_mask.nii.gz \
 			-applyxfm -init $DIR/${i}/anat/3tstandard1mm2diff.mat \
 			-out $DIR/${i}/diff_Masks_3T/R_BLAT \
 			-paddingsize 0.0 -interp trilinear \
 			-ref $DIR/${i}/Diffusion_3T/${i}_nodif_brain.nii.gz
 	 fslmaths $DIR/${i}/diff_Masks_3T/R_BLAT -thr 0.5 -bin $DIR/${i}/diff_Masks_3T/R_BLAT

# # 	# #L_BLAT Mask
  	 flirt \
  		 	-in $DIR/MNI_Masks/AMY/L_BLAT_BIN_mask.nii.gz \
  		 	-applyxfm -init $DIR/${i}/anat/3tstandard1mm2diff.mat \
  		 	-out $DIR/${i}/diff_Masks_3T/L_BLAT \
  		 	-paddingsize 0.0 -interp trilinear \
  		 	-ref $DIR/${i}/Diffusion_3T/${i}_nodif_brain.nii.gz
  	 	fslmaths $DIR/${i}/diff_Masks_3T/L_BLAT -thr 0.5 -bin $DIR/${i}/diff_Masks_3T/L_BLAT

# # 	# #R_PBL Mask
  	 flirt \
  	 		-in $DIR/MNI_Masks/PBL/LPB_r.nii.gz \
  	 		-applyxfm -init $DIR/${i}/anat/3tstandard1mm2diff.mat \
  	 		-out $DIR/${i}/diff_Masks_3T/R_PBL \
  	 		-paddingsize 0.0 -interp trilinear \
  	 		-ref $DIR/${i}/Diffusion_3T/${i}_nodif_brain.nii.gz
  	 	fslmaths $DIR/${i}/diff_Masks_3T/R_PBL -thr 0.5 -bin $DIR/${i}/diff_Masks_3T/R_PBL

# # 	# #L_PBL Mask
  	 flirt \
  	 	 	-in $DIR/MNI_Masks/PBL/LPB_l.nii.gz \
  	 	 	-applyxfm -init $DIR/${i}/anat/3tstandard1mm2diff.mat \
  	 	 	-out $DIR/${i}/diff_Masks_3T/L_PBL \
  	 	 	-paddingsize 0.0 -interp trilinear \
  	 	 	-ref $DIR/${i}/Diffusion_3T/${i}_nodif_brain.nii.gz
  	 	fslmaths $DIR/${i}/diff_Masks_3T/L_PBL -thr 0.5 -bin $DIR/${i}/diff_Masks_3T/L_PBL

# # 	# #R_5M
  	flirt \
  			-in $DIR/MNI_Masks/5M/MNI_R5M_50p.nii.gz \
  			-applyxfm -init $DIR/${i}/anat/3tstandard1mm2diff.mat \
  			-out $DIR/${i}/diff_Masks_3T/R_5M.nii.gz \
  			-paddingsize 0.0 -interp trilinear \
  			-ref $DIR/${i}/Diffusion_3T/${i}_nodif_brain.nii.gz
  		fslmaths $DIR/${i}/diff_Masks_3T/R_5M.nii.gz -thr 0.5 -bin $DIR/${i}/diff_Masks_3T/R_5M.nii.gz

# # 	# #L_5M
  	flirt \
  			-in $DIR/MNI_Masks/5M/MNI_L5M_50p.nii.gz \
  			-applyxfm -init $DIR/${i}/anat/3tstandard1mm2diff.mat \
  			-out $DIR/${i}/diff_Masks_3T/L_5M.nii.gz \
  			-paddingsize 0.0 -interp trilinear \
  			-ref $DIR/${i}/Diffusion_3T/${i}_nodif_brain.nii.gz
  		fslmaths $DIR/${i}/diff_Masks_3T/L_5M.nii.gz -thr 0.5 -bin $DIR/${i}/diff_Masks_3T/L_5M.nii.gz

# # # 	# #PAG
  	 flirt \
  	 		-in $DIR/MNI_Masks/PAG/PAG_50p.nii.gz \
  	 		-applyxfm -init $DIR/${i}/anat/3tstandard1mm2diff.mat \
  	 		-out $DIR/${i}/diff_Masks_3T/PAG.nii.gz \
  	 		-paddingsize 0.0 -interp trilinear \
  	 		-ref $DIR/${i}/Diffusion_3T/${i}_nodif_brain.nii.gz
  	 	fslmaths $DIR/${i}/diff_Masks_3T/PAG.nii.gz -thr 0.5 -bin $DIR/${i}/diff_Masks_3T/PAG.nii.gz

done