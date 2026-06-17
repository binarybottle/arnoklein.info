#!/usr/bin/python
"""
Convert photos for upload to YouTube

(c) 2007, @rno klein
"""
import sys
import os
inputdir      = '/Users/arno/Documents/Projects/ElloraDaily/ellora_daily_reg_linear/'
outputdir     = '/Users/arno/Documents/Projects/ElloraDaily/ellora_daily_reg_linear_converted/'
#inputdir      = '/Users/arno/Documents/Projects/ElloraDaily/ellora_daily_reg_linear_blur_reduce/'
#outputdir     = '/Users/arno/Documents/Projects/ElloraDaily/ellora_daily_reg_linear_blur_reduce_converted/'
#inputdir      = '/Users/arno/Documents/Projects/ElloraDaily/ellora_daily_reg_linear_blur/'
#outputdir     = '/Users/arno/Documents/Projects/ElloraDaily/ellora_daily_reg_linear_blur_converted/'
inputdir = './temp/'
outputdir = './temp/'

#
# Parameters
#
cp_dir = 0 # set to 1
resize = 0
widen = 0
label = 0

rename = 1

if resize:
  resize_x = '320'
  resize_y = '240'
  shift_x = '53'
  shift_y = '0'
if rename:
  image_num = 1978

#----------
# Filenames
#----------
if cp_dir==1:
  cmd = 'mkdir ' + outputdir
  print cmd; os.system(cmd)
  cmd = 'cp ' + inputdir+'*.jpg ' + outputdir
  cmd = 'cp ' + inputdir+'*.JPG ' + outputdir
  print cmd; os.system(cmd)

#-------------------
# Loop through files
#-------------------
if rename:
  file_list = os.listdir(inputdir)  # print file_list
  for filename in file_list:
    if '.jpg' in filename or '.JPG' in filename:
      filename_full_in = inputdir+filename
      cmd = 'cp %s %se%05d.jpg' % (filename_full_in,outputdir,image_num) 
      print cmd; os.system(cmd)
      image_num += 1
else:
  file_list = os.listdir(outputdir)  # print file_list

for filename in file_list:
  filename_full   = outputdir+filename
   #filename_split = filename_full.split('/')
   #filename       = filename_split[-1]
   #filesplit      = filename.split('_')
   #filestem       = filesplit[0]
   #filepath       = "/".join(filename_split[:-1]) + '/'
   #filestem       = ".".join(filesplit[:-1])

  if '_reg_crop.jpg' in filename_full: 

    if resize==1:
      cmd = 'mogrify -geometry x'+resize_y + ' ' + outputdir+filename_full
      print cmd; os.system(cmd)

    if widen==1:
      cmd = 'convert -size ' + resize_x+'x'+resize_y + ' utils/black.jpg -geometry ' + resize_x+'x'+resize_y + ' -composite ' + filename_full + ' -geometry x'+resize_y+'+'+shift_x+'+'+shift_y +' -composite ' + filename_full
      print cmd; os.system(cmd)

    if label==1:
      label_font = " -font '-b&h-lucidatypewriter-medium-r-normal-sans-0-0-75-75-m-0-iso8859-4' -fill white "
      label_location = " -draw 'gravity southeast text 5,5 \""+filestem+"\"' "
      cmd = 'convert ' + label_font + label_location + filename_full + ' ' + filename_full
      print cmd; os.system(cmd)


