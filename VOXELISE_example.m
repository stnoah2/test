clc; clear
cd C:\Users\NOAH\Dropbox\git\test\
%     S=[];
%     [stlcoords] = READ_stl('testmodel.stl');
%     xco = squeeze( stlcoords(:,1,:) )';
%     yco = squeeze( stlcoords(:,2,:) )';
%     zco = squeeze( stlcoords(:,3,:) )';
%     [hpat] = patch(xco,yco,zco,'b');
%     axis equal
    [OUTPUTgrid] = VOXELISE(32,32,32,0,'test.stl','xyz');
    [dim_x,dim_y,dim_z]=size(OUTPUTgrid);
    OUTPUTgrid=cat(1,zeros(ceil((32-dim_x)/2),dim_y,dim_z),OUTPUTgrid,zeros(floor((32-dim_x)/2),dim_y,dim_z));
    OUTPUTgrid=cat(2,zeros(32,ceil((32-dim_y)/2),dim_z),OUTPUTgrid,zeros(32,floor((32-dim_y)/2),dim_z));
    OUTPUTgrid=cat(3,zeros(32,32,ceil((32-dim_z)/2)),OUTPUTgrid,zeros(32,32,floor((32-dim_z)/2)));
    K=OUTPUTgrid(1,:,1);
    for c = 1:32
        for r = 1:32
            if (c==1)&&(r==1)
                K=K;
            else
                K = [K,OUTPUTgrid(r,:,c)];
            end
        end
    end
%     S=[S;K];
    close all;
    filename = 'testdata.csv';
    dlmwrite(filename,K,'-append');
    disp('COMPLETE!');

% p = patch(isosurface(OUTPUTgrid,0));
% set(p, 'FaceColor', 'red', 'EdgeColor', 'none');
% axis off
% 
% daspect([1 1 1]);
% view(3)
% camlight
% lighting gouraud