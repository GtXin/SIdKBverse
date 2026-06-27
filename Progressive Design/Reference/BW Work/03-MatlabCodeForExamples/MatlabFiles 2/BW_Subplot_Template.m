function [SP] = BW_Subplot_Template(rows,cols,figure_title,center_title)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

            if nargin<4
                center_title='';
            elseif nargin<3
                figure_title='';              
            end

top_margin=.1;
SP1=subplot('position',[0.05,1-top_margin+.05,0.9,top_margin-.05]);
set(SP1, 'xlim',[0,40],...
    'ylim',[0,20]);
axis(SP1);
axis off;
t1=text;
t1.String=figure_title;
t1.FontName='Times New Roman';
t1.FontUnits='normalized';
if iscell(figure_title)&&(~isempty(figure_title))
    t1.FontSize=1/length(figure_title);
else
    t1.FontSize=.75;
end
t1.Units='normalized';
t1.Position=[0 .45 0];

datestr1 = strcat(['',  datestr(now,'mmm.dd,yyyy HH:MM:SS pm')]);
t1=text;
t1.String=datestr1;
t1.FontName='Times New Roman';
t1.FontUnits='normalized';
t1.FontSize=.5;
t1.Units='normalized';
t1.Position=[.85 .5 0];

t1=text;
t1.Units='normalized';
t1.FontUnits='normalized';
t1.String=center_title;
if iscell(center_title)&&(~isempty(center_title))
    t1.FontSize=1/length(center_title);
else
    t1.FontSize=.75;
end
t1.FontName='Times New Roman';
t1.Position=[.4 .5 0];
  
left_margin=.05;
right_margin=.05;
bottom_margin=.05;
horizontal_separation=.07;
vertical_separation=.07;
width=(1-((cols-1)*horizontal_separation+left_margin+right_margin))/cols;
height=(1-((rows-1)*vertical_separation+top_margin+bottom_margin))/rows;
i_n=0;
for ii=1:rows
    for jj=1:cols
        i_n=i_n+1;

       
        left=left_margin+(jj-1)*(horizontal_separation+width);  
        bottom=bottom_margin+(rows-ii)*(vertical_separation+height);        
        pos=[left bottom width height];
        SP(i_n)=subplot('position',pos);
        axis square
        axis off;
    end

end

