for i in range(1000,1786):
   ....:     os.system('montage -geometry 1200x1600+0+0! -tile 2x1 -quality 100 ellora_daily_reg_linear/e0'+str(i)+'.jpg ellora_daily_reg_linear_blur/e0'+str(i)+'.jpg e'+str(i)+'.jpg')
