
function BW_Archive_Files_in_Memory_to_ZIP(zip_file_name,file1)
% This code copies all the functions used by
clear LIST
%zip_file_name='Z:\Medennium\IOL\SetUpDiffractiveOptimization\CBW_IOL_Design_22May2023';

folder_locations_to_exclude={'B:\Program Files' 'AppData\Local' 'Z:\BW_Matlab_Startup_Folder\startup'  ...
    'BW_Archive_Files_in_Memory_to_ZIP'};

folder_locations_to_exclude={'B:\Program Files' 'AppData\Local' 'Z:\BW_Matlab_Startup_Folder\startup'  ...
    };


[M,X] = inmem('-completenames');

for jj=1:length(folder_locations_to_exclude)
    [a]=find(contains(M,folder_locations_to_exclude{jj} )==0);  
    M=M(a);
end


JJ=0;
 for ii=1:length(M)
     if ~isempty(M{ii})
         JJ=JJ+1;
         LIST{JJ}=M{ii};
     end
 end
 
 for ii=1:length(LIST)
     a=dir(LIST{ii});
     disp([a.date  '   ' LIST{ii}       ]);
 end
 
 if nargin==2
     LIST{ii+1} = file1;
 end
 zip(zip_file_name,LIST);
 

