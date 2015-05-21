function som = plot_nodes(M)
% PLOT_NODES(W) displays edges and vertices of NxN or NxNxN grid according
% to their weights W.

% we want to plot edges and weights together
hold on

% we return a handle to the plotted objects for erasure
som = [];

V = rands(2,1000);
V=V'
%  Update to plot



scatter(V(:,1),V(:,2),'.g')
hold off
%                             som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'k-',M(:,2,1), ...
%                             M(:,2,2),'k-',M(:,3,1),M(:,3,2),'k',M(:,4,1),M(:,4,2),'k-',M(1,:,1),M(1,:,2),'k-', ...
%                             M(2,:,1),M(2,:,2),'k-',M(3,:,1),M(3,:,2),'k',...
%                             M(:,5,1),M(:,5,2),'k-',M(5,:,1),M(5,:,2),'k-',...
%                             M(4,:,1), M(4,:,2),'k-',0,0,'.',1,1,'.');
%
som = plot(M(:,:,1), M(:,:,2),'ro',M(:,1,1),M(:,1,2),'b-',M(:,2,1), ...
    M(:,2,2),'b-',M(:,3,1),M(:,3,2),'b-',M(:,4,1),M(:,4,2),'b-', ...
    M(:,5,1),M(:,5,2),'b-',M(:,6,1),M(:,6,2),'b-',M(:,7,1), ...
    M(:,7,2),'b-',M(:,8,1),M(:,8,2),'b-',M(1,:,1),M(1,:,2),'b-', ...
    M(2,:,1),M(2,:,2),'b-',M(3,:,1),M(3,:,2),'b-',M(4,:,1), ...
    M(4,:,2),'b-',M(5,:,1),M(5,:,2),'b-',M(6,:,1),M(6,:,2),'b-', ...
    M(7,:,1),M(7,:,2),'b-',M(8,:,1),M(8,:,2),'b-',M(:,3,1), ...
    M(:,3,2),'b-',M(:,4,1),M(:,4,2),'b-',0,0,'.',1,1,'.');

hold on

%















% % get dimensionality
% d = size(w, 2);
%
% % get grid size
% n = ceil(power(size(w, 1), 1/d));
%
% if d == 3
%
%     % plot one plane of units at a time
%     for i = 1:n
%
%         % plot vertical planes of edges
%         h = [h plot_planes(w, (i-1) * n^2 + 1 : i * n^2, n, h)];
%
%         % plot horizontal planes of edges
%         h = [h plot_planes(w, i:n:n^3, n, h)];
%
%     end
%
%     % weights are represented as an N^3 x 3 array, but we want
%     % N x N x N x 3
%     w = reshape(w, n, n, n, 3);
%
%     % plot inside unit cube
%     axis([0 1 0 1 0 1]);
%
%     % show a nice perspective
%     view(332.5, 30);
%
% else
%
%     % weights are represented as an N^2 x 2 array, but we want N x N x 2
%     w = reshape(w, n, n, 2);
% 
%     % plot edges between columns
%     for i = 1:n
%         h = [h plot(w(i,:, 1), w(i,:,2))];
%     end
% 
%     % plot edges between rows
%     for j = 1:n
%         h = [h plot(w(:,j,1), w(:,j,2))];
%     end
% 
%     % plot vertices
%     hh = plot(w(:,:,1), w(:,:,2), ...
%         'ko', 'MarkerSize',7, 'MarkerFaceColor','r');
% 
%     % add vertex plot to graphics-handle array
%     h = [h reshape(hh, 1, size(hh, 1))];
% 
%     % plot inside unit square
%     axis([0 1 0 1]);
%     
end


% function h = plot_planes(w, rows, n, h)
% 
% % isolate relevant planes by row
% w = w(rows, :);
% 
% % weights are represented as an N^2 x 3 array, but we want N x N x 3
% w = reshape(w, n, n, 3);
% 
% % plot edges between columns
% for j = 1:n
%     h = [h plot3(w(j,:, 1), w(j,:,2), w(j,:,3))];
% end
% 
% % plot edges between rows
% for j = 1:n
%     h = [h plot3(w(:,j,1), w(:,j,2), w(:,j,3))];
% end
