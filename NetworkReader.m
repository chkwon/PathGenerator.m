function [N A st en alpha beta capacity gamma top_mtx] = NetworkReader(net_file)

[N, A] = textread(net_file, '%u %u', 1);
[st, en, alpha, beta, capacity, gamma] = textread(net_file, '%u %u %f %f %f %u', A, 'headerlines', 1);

top_mtx = sparse(N,N);
for i=1:A
    top_mtx( st(i), en(i) ) = i;
end

N;A;st;en;alpha;beta;capacity;gamma;top_mtx;