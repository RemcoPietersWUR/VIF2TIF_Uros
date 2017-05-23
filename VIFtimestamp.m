function [timestamp]=VIFtimestamp(PathName,FileName,Nframes,AOIWidth,AOIHeight)
%VIFtimestamp get timestamps from VIF file

%Open file
fid=fopen(fullfile(PathName,FileName));
%Seek to 65 byte (skipping header)
fseek(fid,64,'cof');
for frame=1:Nframes
    %Read header
    timestamp(frame) = fread(fid, [1,1],'*uint64');
    %Seek image
    fseek(fid,AOIWidth*AOIHeight,'cof');
    %Seek footer
    fseek(fid,504,'cof');
end
