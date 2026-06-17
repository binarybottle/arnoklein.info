% Blur neighboring images together according to a Gaussian kernel 
% whose FWHM is a given number of days
%
% (c) @rno klein, 2007

%---------------------------------
% Define input/output directories:
%---------------------------------
 img_numbers = [1:100:900,950,1000:25:1100,1120:20:1200,1210:10:1250,1252:2:1260,1261:1282];
 
 blur_mean     = 1;
 plot_all      = 0;
 print_final   = 1;
  
 img_dir_in  = '/Users/arno/Documents/Projects/ElloraDaily/ellora_daily_reg_linear';
 img_dir_out = '/Users/arno/Documents/Projects/ElloraDaily/ellora_daily_reg_linear_blur_reduce';
 warning off; s=sprintf('mkdir %s;', img_dir_out); eval(s);
 warning on;

%--------------------
% Loop through images
%--------------------
 figure('Position',[0,0,400,400]);

 N = length(img_numbers);
 s=sprintf('img_ex = imread(''%s/e00005_reg_crop.jpg'',''jpeg'');', img_dir_in); eval(s);

 [xdim,ydim,zdim] = size(img_ex);

 B = double(zeros(xdim,ydim,zdim));

 for i = N : -1 : 1

   img_num = img_numbers(i);
   if ((img_num >=    0) && (img_num <=    9)), prefix_zeros = '0000'; end
   if ((img_num >=   10) && (img_num <=   99)), prefix_zeros =  '000'; end
   if ((img_num >=  100) && (img_num <=  999)), prefix_zeros =   '00'; end
   if ((img_num >= 1000) && (img_num <= 9999)), prefix_zeros =    '0'; end
  
   s=sprintf('S = imread(''%s/e%s%d_reg_crop.jpg'',''jpeg'');', img_dir_in,prefix_zeros,img_num); eval(s);
   
   S = double(S)./N;
   B = B + S;
   
   if plot_all==1
      image(B./max(B(:))); axis equal; axis off;
      s=sprintf('title(''Average %d (%d images)'');',N,N-i+1); eval(s);
      drawnow
   end

   if print_final==1
      s=sprintf('imwrite(B./max(B(:)),''%s/e%s%d_reg_crop.jpg'',''jpeg'');',img_dir_out,prefix_zeros,img_num); 
      eval(s);
   end

 end
