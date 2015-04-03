function WaveEig

% Driver script for solving the 3D advection equations

hybridgGlobals3D
global useLSC

useLSC = 0;

% prism_mesh
hybrid_mesh
% EToV(EToV==0) = -1; EToV = EToV'; EToE = EToE'; EToF = EToF'; % if
% hybrid_mesh2
% pyr_mesh
% prism_mesh2

% hex_mesh
K = size(EToV,1);

C = hsv(3);
for N = 1:3;
    
    hybridgStartUp
    
    % get eigenvalues
    
    Ndofs = NpH*KH + NpW*KW + NpP*KP + NpT*KT;
    rhsp = zeros(NpMax,K); rhsu = zeros(NpMax,K); rhsv = zeros(NpMax,K); rhsw = zeros(NpMax,K);
    
    e1 = zeros(NpMax,K); e2 = zeros(NpMax,K);
    e3 = zeros(NpMax,K); e4 = zeros(NpMax,K);
    
    % pick out nonzero entries of dof matrix
    e1(1:NpH,hexK) = 1; e1(1:NpW,wedgK) = 1;
    e1(1:NpP,pyrK) = 1; e1(1:NpT,tetK) = 1;
    inds = find(e1);
    
    for i = 1:4*Ndofs
        e = zeros(4*Ndofs,1);
        e(i) = 1;
        e1v = e(1:Ndofs);
        e2v = e(Ndofs + (1:Ndofs));
        e3v = e(2*Ndofs + (1:Ndofs));
        e4v = e(3*Ndofs + (1:Ndofs));
        
        e1(inds) = e1v;    e2(inds) = e2v;
        e3(inds) = e3v;    e4(inds) = e4v;
        
        [e1s e2s e3s e4s] = SurfaceInterp(e1,e2,e3,e4);
        
        [rhspK rhsuK rhsvK rhswK] = RHS(e1,e2,e3,e4,e1s,e2s,e3s,e4s,VH,VHr,VHs,VHt,VHf,hexK );
        NpK = NpH; typeK = hexK;
        rhsp(1:NpK,typeK) = rhspK;    rhsu(1:NpK,typeK) = rhsuK;
        rhsv(1:NpK,typeK) = rhsvK;    rhsw(1:NpK,typeK) = rhswK;
        
        if useLSC
            [rhspK rhsuK rhsvK rhswK] = LSC_RHS(e1,e2,e3,e4,e1s,e2s,e3s,e4s,...
                VW,VWr,VWs,VWt,VWf,wedgK,...
                sqJW, sqJWf, JWr, JWs, JWt);
        else
            [rhspK rhsuK rhsvK rhswK] = RHS(e1,e2,e3,e4,e1s,e2s,e3s,e4s,VW,VWr,VWs,VWt,VWf,wedgK);
        end
        NpK = NpW; typeK = wedgK;
        rhsp(1:NpK,typeK) = rhspK;    rhsu(1:NpK,typeK) = rhsuK;
        rhsv(1:NpK,typeK) = rhsvK;    rhsw(1:NpK,typeK) = rhswK;
        
        [rhspK rhsuK rhsvK rhswK] = RHS(e1,e2,e3,e4,e1s,e2s,e3s,e4s,VP,VPr,VPs,VPt,VPf,pyrK );
        NpK = NpP; typeK = pyrK;
        rhsp(1:NpK,typeK) = rhspK;    rhsu(1:NpK,typeK) = rhsuK;
        rhsv(1:NpK,typeK) = rhsvK;    rhsw(1:NpK,typeK) = rhswK;
        
        [rhspK rhsuK rhsvK rhswK] = RHS(e1,e2,e3,e4,e1s,e2s,e3s,e4s,VT,VTr,VTs,VTt,VTf,tetK );
        NpK = NpT; typeK = tetK;
        rhsp(1:NpK,typeK) = rhspK;    rhsu(1:NpK,typeK) = rhsuK;
        rhsv(1:NpK,typeK) = rhsvK;    rhsw(1:NpK,typeK) = rhswK;
        
        A(0*Ndofs + (1:Ndofs),i) = rhsp(inds);
        A(1*Ndofs + (1:Ndofs),i) = rhsu(inds);
        A(2*Ndofs + (1:Ndofs),i) = rhsv(inds);
        A(3*Ndofs + (1:Ndofs),i) = rhsw(inds);
    end
    A(abs(A)<1e-8)=0;
    
    lam = eig(A);
    
    hold on
    plot(lam,'.','color',C(N,:))
    rlam = linspace(min(real(lam)),max(real(lam)),50);
    ilam = linspace(min(imag(lam)),max(imag(lam)),50);
    box1 = [rlam + 1i*max(ilam),nan, rlam + 1i*min(ilam)];
    box2 = [1i*ilam + max(rlam),nan, 1i*ilam + min(rlam)];
    plot(box1,'k--')
    plot(box2,'k--')
    axis square
end
keyboard

function [rhsp rhsu rhsv rhsw] = RHS(p,u,v,w, ...
    p_surface,u_surface,v_surface,w_surface,...
    V,Vr,Vs,Vt,Vf,typeK)

hybridgGlobals3D;

if nnz(typeK)==0
    rhsp = []; rhsu = []; rhsv = []; rhsw = [];
    return
end

% element-type specifics
Nc = size(V,1); Np = size(V,2); Nfc = size(Vf,1);

invMK = invM(1:Np,typeK); wJK = wJ(1:Nc,typeK);  wsJK = wsJ(1:Nfc,typeK);

rxK = rx(1:Nc,typeK); sxK = sx(1:Nc,typeK); txK = tx(1:Nc,typeK);
ryK = ry(1:Nc,typeK); syK = sy(1:Nc,typeK); tyK = ty(1:Nc,typeK);
rzK = rz(1:Nc,typeK); szK = sz(1:Nc,typeK); tzK = tz(1:Nc,typeK);

nxK = nx(1:Nfc,typeK); nyK = ny(1:Nfc,typeK); nzK = nz(1:Nfc,typeK);
pK = p(1:Np,typeK); uK = u(1:Np,typeK); vK = v(1:Np,typeK); wK = w(1:Np,typeK);

[flux_p flux_u] = SurfaceFlux(p_surface,u_surface,v_surface,w_surface,Vf,typeK);

% integrated by parts pressure equation
uc = wJK.*(V*uK); vc = wJK.*(V*vK); wc = wJK.*(V*wK);
Vxu = Vr'*(rxK.*uc) + Vs'*(sxK.*uc) + Vt'*(txK.*uc);
Vyv = Vr'*(ryK.*vc) + Vs'*(syK.*vc) + Vt'*(tyK.*vc);
Vzw = Vr'*(rzK.*wc) + Vs'*(szK.*wc) + Vt'*(tzK.*wc);
gradvU = Vxu + Vyv + Vzw;
rhsp = invMK.*(gradvU + Vf'*(wsJK.*flux_p));

% volume derivative operators
pr = Vr*pK; ps = Vs*pK; pt = Vt*pK;
dpdx = rxK.*pr + sxK.*ps + txK.*pt;
dpdy = ryK.*pr + syK.*ps + tyK.*pt;
dpdz = rzK.*pr + szK.*ps + tzK.*pt;

flux_uc = wsJK.*flux_u;
rhsu = invMK.*(-V'*(wJK.*dpdx) + Vf'*(nxK.*flux_uc));
rhsv = invMK.*(-V'*(wJK.*dpdy) + Vf'*(nyK.*flux_uc));
rhsw = invMK.*(-V'*(wJK.*dpdz) + Vf'*(nzK.*flux_uc));

return

function [rhsp rhsu rhsv rhsw] = LSC_RHS(p,u,v,w, ...
    p_surface,u_surface,v_surface,w_surface,...
    V,Vr,Vs,Vt,Vf,typeK,...
    sqJK, sqJKf, JKr, JKs, JKt)

hybridgGlobals3D;

if nnz(typeK)==0
    rhsp = []; rhsu = []; rhsv = []; rhsw = [];
    return
end

% element-type specifics
Nc = size(V,1); Np = size(V,2); Nfc = size(Vf,1);

% invMK = invM(1:Np,typeK);
invMK = ones(Np,length(typeK));
wJK = wJ(1:Nc,typeK);  wsJK = wsJ(1:Nfc,typeK);

rxK = rx(1:Nc,typeK); sxK = sx(1:Nc,typeK); txK = tx(1:Nc,typeK);
ryK = ry(1:Nc,typeK); syK = sy(1:Nc,typeK); tyK = ty(1:Nc,typeK);
rzK = rz(1:Nc,typeK); szK = sz(1:Nc,typeK); tzK = tz(1:Nc,typeK);

nxK = nx(1:Nfc,typeK); nyK = ny(1:Nfc,typeK); nzK = nz(1:Nfc,typeK);
pK = p(1:Np,typeK); uK = u(1:Np,typeK); vK = v(1:Np,typeK); wK = w(1:Np,typeK);

[flux_p flux_u] = SurfaceFlux(p_surface,u_surface,v_surface,w_surface,Vf,typeK);

% % integrated by parts pressure equation
% uc = wJK.*(V*uK); vc = wJK.*(V*vK); wc = wJK.*(V*wK);
% Vrxu = Vr'*(rxK.*uc); Vsxu = Vs'*(sxK.*uc); Vtxu = Vt'*(txK.*uc);
% Vryv = Vr'*(ryK.*vc); Vsyv = Vs'*(syK.*vc); Vtyv = Vt'*(tyK.*vc);
% Vrzw = Vr'*(rzK.*wc); Vszw = Vs'*(szK.*wc); Vtzw = Vt'*(tzK.*wc);

% LSC approach - chain rule derivatives
uc = wJK.*(V*uK).*sqJK.*sqJK;
Vrxu = Vr'*(rxK.*uc) + V'*(JKr.*rxK.*uc);
Vsxu = Vs'*(sxK.*uc) + V'*(JKs.*rxK.*uc);
Vtxu = Vt'*(txK.*uc) + V'*(JKt.*rxK.*uc);

vc = wJK.*(V*vK).*sqJK.*sqJK;
Vryv = Vr'*(ryK.*vc) + V'*(JKr.*ryK.*vc);
Vsyv = Vs'*(syK.*vc) + V'*(JKs.*ryK.*vc);
Vtyv = Vt'*(tyK.*vc) + V'*(JKt.*ryK.*vc);

wc = wJK.*(V*wK).*sqJK.*sqJK;
Vrzw = Vr'*(rzK.*wc) + V'*(JKr.*rzK.*wc);
Vszw = Vs'*(szK.*wc) + V'*(JKs.*rzK.*wc);
Vtzw = Vt'*(tzK.*wc) + V'*(JKt.*rzK.*wc);

Vxu = Vrxu + Vsxu + Vtxu;
Vyv = Vryv + Vsyv + Vtyv;
Vzw = Vrzw + Vszw + Vtzw;
gradvU = Vxu + Vyv + Vzw;
rhsp = invMK.*(gradvU + Vf'*(sqJKf.*wsJK.*flux_p));

% volume derivative operators
% pr = Vr*pK; ps = Vs*pK; pt = Vt*pK;

pr = (Vr*pK - (V*pK).*JKr).*sqJK;
ps = (Vs*pK - (V*pK).*JKs).*sqJK;
pt = (Vt*pK - (V*pK).*JKt).*sqJK;

dpdx = rxK.*pr + sxK.*ps + txK.*pt;
dpdy = ryK.*pr + syK.*ps + tyK.*pt;
dpdz = rzK.*pr + szK.*ps + tzK.*pt;

flux_uc = sqJKf.*wsJK.*flux_u;
sqwJK = sqJK.*wJK;

rhsu = invMK.*(-V'*(sqwJK.*dpdx) + Vf'*(nxK.*flux_uc));
rhsv = invMK.*(-V'*(sqwJK.*dpdy) + Vf'*(nyK.*flux_uc));
rhsw = invMK.*(-V'*(sqwJK.*dpdz) + Vf'*(nzK.*flux_uc));

return

% independent of regular DG or LSC-DG
function [flux_p flux_u] = SurfaceFlux(p_surface,u_surface,v_surface,w_surface,...
    Vf,typeK)

hybridgGlobals3D;

if nnz(typeK)==0
    flux_p = []; flux_u = [];
    return
end

Nfc = size(Vf,1); Np = size(Vf,2);
nxK = nx(1:Nfc,typeK); nyK = ny(1:Nfc,typeK); nzK = nz(1:Nfc,typeK);

mapMK = mapM(1:Nfc,typeK); mapPK = mapP(1:Nfc,typeK);

% flux gather
p_jump  = p_surface(mapPK) - p_surface(mapMK);
u_jump  = u_surface(mapPK) - u_surface(mapMK);
v_jump  = v_surface(mapPK) - v_surface(mapMK);
w_jump  = w_surface(mapPK) - w_surface(mapMK);
nu_jump = nxK.*u_jump + nyK.*v_jump + nzK.*w_jump;

u_avg  = .5*(u_surface(mapPK) + u_surface(mapMK));
v_avg  = .5*(v_surface(mapPK) + v_surface(mapMK));
w_avg  = .5*(w_surface(mapPK) + w_surface(mapMK));
nu_avg = nxK.*u_avg + nyK.*v_avg + nzK.*w_avg;

flux_p = .5*p_jump - nu_avg;
flux_u = .5*(nu_jump - p_jump);

% apply BCs, todo: try p^+ = - p ^ -, which is energy stable
mapBK = mapMK==mapPK;
flux_p(mapBK) = .5*(-p_surface(mapMK(mapBK))) - nu_avg(mapBK);
flux_u(mapBK) = .5*(p_surface(mapMK(mapBK)));

function [ps us vs ws] = SurfaceInterp(p,u,v,w)

global useLSC
hybridgGlobals3D

ps = zeros(NfcMax,K);
us = zeros(NfcMax,K);
vs = zeros(NfcMax,K);
ws = zeros(NfcMax,K);

ps(1:NfcH,hexK ) = VHf*p(1:NpH,hexK );
us(1:NfcH,hexK ) = VHf*u(1:NpH,hexK );
vs(1:NfcH,hexK ) = VHf*v(1:NpH,hexK );
ws(1:NfcH,hexK ) = VHf*w(1:NpH,hexK );

if useLSC
    % wedges LSC interp
    ps(1:NfcW,wedgK) = (VWf*p(1:NpW,wedgK)).*sqJWf;
    us(1:NfcW,wedgK) = (VWf*u(1:NpW,wedgK)).*sqJWf;
    vs(1:NfcW,wedgK) = (VWf*v(1:NpW,wedgK)).*sqJWf;
    ws(1:NfcW,wedgK) = (VWf*w(1:NpW,wedgK)).*sqJWf;
else
    ps(1:NfcW,wedgK) = VWf*p(1:NpW,wedgK);
    us(1:NfcW,wedgK) = VWf*u(1:NpW,wedgK);
    vs(1:NfcW,wedgK) = VWf*v(1:NpW,wedgK);
    ws(1:NfcW,wedgK) = VWf*w(1:NpW,wedgK);
end
ps(1:NfcP,pyrK ) = VPf*p(1:NpP,pyrK );
us(1:NfcP,pyrK ) = VPf*u(1:NpP,pyrK );
vs(1:NfcP,pyrK ) = VPf*v(1:NpP,pyrK );
ws(1:NfcP,pyrK ) = VPf*w(1:NpP,pyrK );

ps(1:NfcT,tetK ) = VTf*p(1:NpT,tetK );
us(1:NfcT,tetK ) = VTf*u(1:NpT,tetK );
vs(1:NfcT,tetK ) = VTf*v(1:NpT,tetK );
ws(1:NfcT,tetK ) = VTf*w(1:NpT,tetK );

