clear all;

net_file = 'SiouxFalls.txt';
od_demand_file = 'SiouxFallsDemand528.txt';

% As Path generation process takes a long time, one may want to re-use
% the previoiusly generated path file. If regenerate_path=0, Re-use.
regenerate_path = 0;

max_arc = 11;

% NetworkReader reads the network topolgy in 'net_file'
% to obtain the arc structure and cost
[N A st en alpha beta capacity gamma top_mtx] = NetworkReader(net_file);
gamma = ones(size(gamma));
% ODPairReader reads the file 'net_file'
% to obtain the OD pairs and demands
[W origin destination demand] = ODPairReader(od_demand_file);

% PathGenerator generates the set of paths from origin 'org' to 'des'
% and records it in a file 'path_file'
path_file = 'paths.txt';
if (regenerate_path==1)
    fid0 = fopen(path_file, 'w');
    fclose(fid0);
    for i=1:W
        org = origin(i);
        des = destination(i);
        PathGenerator(path_file, org, des, N, A, st, en, top_mtx);
    end
end
