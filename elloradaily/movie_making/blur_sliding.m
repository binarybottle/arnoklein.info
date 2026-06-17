% Blur neighboring images together according to a Gaussian kernel 
% whose FWHM is a given number of days
%
% (c) @rno klein, 2007

%---------------------------------
% Define input/output directories:
%---------------------------------
 img_numbers = 1773:1800; % do not start with zero
 window_size = 15; % number of images to blur together

 blur_mean     = 0;
 blur_gaussian = 1;
   widthfactor = 1;

 plot_all      = 0;
 print_final   = 1;
  
 img_dir_in  = '/Users/arno/Documents/Projects/ElloraDaily/ellora_daily_reg_linear';
 img_dir_out = '/Users/arno/Documents/Projects/ElloraDaily/ellora_daily_reg_linear_blur';
 warning off; s=sprintf('mkdir %s;', img_dir_out); eval(s);
 warning on;

%--------------------
% Loop through images
%--------------------
 if plot_all==1
    figure('Position',[0,0,1200,400]);
 end
 
 s=sprintf('img_ex = imread(''%s/e00001.jpg'',''jpeg'');', img_dir_in); eval(s);

 [xdim,ydim,zdim] = size(img_ex);

 B0 = zeros(xdim,ydim,window_size);
 S0 = zeros(xdim,ydim,3);

 if blur_gaussian==1
    x  = 0:2*exp(1)/window_size:exp(1);
    x  = [x(end:-1:2) x(1:end)];
    gx = exp(1).^(-widthfactor*x.^2);
    G  = B0;
    for iw = 1:window_size
       G(:,:,iw) = gx(iw) * ones(xdim,ydim);
    end
 end

 for i = 1 : length(img_numbers)-window_size

   img_num0 = img_numbers(i);
   
   disp(['Image ' num2str(img_num0)]);
       
     
   B1 = B0;
   B2 = B1; 
   B3 = B1; 

   if ((img_num0 >=    0) && (img_num0 <=    9)), prefix_zeros0 = '0000'; end
   if ((img_num0 >=   10) && (img_num0 <=   99)), prefix_zeros0 =  '000'; end
   if ((img_num0 >=  100) && (img_num0 <=  999)), prefix_zeros0 =   '00'; end
   if ((img_num0 >= 1000) && (img_num0 <= 9999)), prefix_zeros0 =    '0'; end
  
   for i2 = 0 : window_size-1

     img_num = img_numbers(i+i2);

     if ((img_num >=    0) && (img_num <=    9)), prefix_zeros = '0000'; end
     if ((img_num >=   10) && (img_num <=   99)), prefix_zeros =  '000'; end
     if ((img_num >=  100) && (img_num <=  999)), prefix_zeros =   '00'; end
     if ((img_num >= 1000) && (img_num <= 9999)), prefix_zeros =    '0'; end

     s=sprintf('S = imread(''%s/e%s%d.jpg'',''jpeg'');', img_dir_in,prefix_zeros,img_num); eval(s);

     %[lenSx,lenSy,lenSz] = size(S);

     S = S(1:xdim,1:ydim,1:zdim);
     
     if plot_all==1
        subplot(1,3,1); image(S); axis equal; axis off;
        s=sprintf('title(''%s/e%s%d.jpg'');',img_dir_in,prefix_zeros,img_num); eval(s);
     end

     B1(:,:,i2+1) = S(:,:,1);
     B2(:,:,i2+1) = S(:,:,2);
     B3(:,:,i2+1) = S(:,:,3);

   end
   
   if blur_mean==1
      B1m=squeeze(mean(B1,3));
      B2m=squeeze(mean(B2,3));
      B3m=squeeze(mean(B3,3));
      Sm = S0;
      Sm(:,:,1) = B1m/max(B1m(:));
      Sm(:,:,2) = B2m/max(B2m(:));
      Sm(:,:,3) = B3m/max(B3m(:));
      if plot_all==1
         subplot(1,3,2); image(Sm); axis equal; axis off;
         title('Average');
      end
   end
   if blur_gaussian==1
      B1g = B1.*G;
      B2g = B2.*G;
      B3g = B3.*G;       
      B1g=squeeze(mean(B1g,3));
      B2g=squeeze(mean(B2g,3));
      B3g=squeeze(mean(B3g,3));       
      Sg = S0;
      Sg(:,:,1) = B1g/max(B1g(:));
      Sg(:,:,2) = B2g/max(B2g(:));
      Sg(:,:,3) = B3g/max(B3g(:));
      if plot_all==1
         subplot(1,3,3); image(Sg); axis equal; axis off; 
         title('Gaussian');
      end
   end

   drawnow
   
   if print_final==1
      %image(Sg); axis equal; axis off; 
      s=sprintf('imwrite(Sg,''%s/e%s%d.jpg'',''jpeg'');',img_dir_out,prefix_zeros0,img_num0); 
      eval(s);
   end
       
 end
