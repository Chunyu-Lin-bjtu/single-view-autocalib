function [v,w,f,l] = t2u_to_vw(m,u)
    v = nan(3,2);
    w = nan(3,2);
    f = nan(1,2);
    l = nan(3,2); % l = cross(v,w)
    
    a = u(3,1)^2*(m(1,1)*m(1,2) + m(2,1)*m(2,2));
    b = m(1,1)*m(1,2)*u(2,1)^2 + m(2,1)*m(2,2)*u(1,1)^2 - ...
        m(1,1)*m(2,2)*u(1,1)*u(2,1) - m(1,2)*m(2,1)*u(1,1)*u(2,1) - ...
        m(1,1)*m(3,2)*u(1,1)*u(3,1) - m(1,2)*m(3,1)*u(1,1)*u(3,1) - ...
        m(2,1)*m(3,2)*u(2,1)*u(3,1) - m(2,2)*m(3,1)*u(2,1)*u(3,1);
    c =  m(3,1)*m(3,2)*(u(1,1)^2 + u(2,1)^2);
    
    f = zeros(1,2);
    d = sqrt(b^2 - 4*a*c);
    f(1) = sqrt((-b+d)/(2*a));
    f(2) = sqrt((-b-d)/(2*a));
    for k=1:2
        IAC = diag([1/f(k)^2, 1/f(k)^2, 1]);
        l(:,k) = IAC*u;
        v(:,k) = cross(l(:,k),m(:,1));
        w(:,k) = cross(l(:,k),m(:,2));
        %    u3 = cross(l,m(:,2));
        %    K = [f(k) 0 0; 0 f(k) 0; 0 0 1];
        %    R(:,:,k) = K \ [u u2 u3];
        %    R(:,:,k) = R(:,:,k)./[norm(R(:,1,k)) norm(R(:,2,k)) norm(R(:,3, ...
        %                                                      k))];
        %    if det(R(:,:,k)) < 0
        %        R(:,:,k) = [-1 0 0;0 1 0; 0 0 1]*R(:,:,k)
        %    end     
    end
    % PT.renormI([u v(:,1) w(:,1)])
    % PT.renormI([u v(:,2) w(:,2)])
end