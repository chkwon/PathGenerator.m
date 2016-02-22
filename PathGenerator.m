function PathGenerator(path_file, org, des, N, A, st, en, top_mtx)

fid1 = fopen(path_file, 'a');
list_path(1) = org;
FindNeighbor(N, A, org, top_mtx, des, list_path, fid1);
fclose(fid1);

% N;A;top_mtx;st;en;alpha;beta;capacity;gamma;


function neighbor = FindNeighbor(N, A, ni, top_mtx, dest, list_path, fid1)
% k = 1;
p_len = length(list_path);
for i=1:N
    visited = 0;
    for j=1:p_len
        if list_path(j) == i, visited = 1; break;, end;
    end

    if visited == 0
        if top_mtx(ni,i) > 0
            list_path(p_len+1) = i;
            if i==dest
                RecordPath(list_path, fid1);
            else
%                 neighbor(k) = i;
%                 k = k + 1;
                FindNeighbor(N, A, i, top_mtx, dest, list_path, fid1);
            end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function RecordPath(list_path, fid1)
fprintf(fid1, '%u ', list_path);
fprintf(fid1, '\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
