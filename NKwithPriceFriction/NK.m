%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'NK';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NK.log');
M_.exo_names = 'epsa';
M_.exo_names_tex = 'epsa';
M_.exo_names_long = 'epsa';
M_.exo_names = char(M_.exo_names, 'epsm');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsm');
M_.exo_names_long = char(M_.exo_names_long, 'epsm');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'infl');
M_.endo_names_tex = char(M_.endo_names_tex, 'infl');
M_.endo_names_long = char(M_.endo_names_long, 'infl');
M_.endo_names = char(M_.endo_names, 'int');
M_.endo_names_tex = char(M_.endo_names_tex, 'int');
M_.endo_names_long = char(M_.endo_names_long, 'int');
M_.endo_names = char(M_.endo_names, 'm');
M_.endo_names_tex = char(M_.endo_names_tex, 'm');
M_.endo_names_long = char(M_.endo_names_long, 'm');
M_.endo_names = char(M_.endo_names, 'mc');
M_.endo_names_tex = char(M_.endo_names_tex, 'mc');
M_.endo_names_long = char(M_.endo_names_long, 'mc');
M_.endo_names = char(M_.endo_names, 'inflo');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflo');
M_.endo_names_long = char(M_.endo_names_long, 'inflo');
M_.endo_names = char(M_.endo_names, 'x1');
M_.endo_names_tex = char(M_.endo_names_tex, 'x1');
M_.endo_names_long = char(M_.endo_names_long, 'x1');
M_.endo_names = char(M_.endo_names, 'x2');
M_.endo_names_tex = char(M_.endo_names_tex, 'x2');
M_.endo_names_long = char(M_.endo_names_long, 'x2');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'v');
M_.endo_names_tex = char(M_.endo_names_tex, 'v');
M_.endo_names_long = char(M_.endo_names_long, 'v');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'DLm');
M_.endo_names_tex = char(M_.endo_names_tex, 'DLm');
M_.endo_names_long = char(M_.endo_names_long, 'DLm');
M_.endo_partitions = struct();
M_.param_names = 'bbeta';
M_.param_names_tex = 'bbeta';
M_.param_names_long = 'bbeta';
M_.param_names = char(M_.param_names, 'ssigma');
M_.param_names_tex = char(M_.param_names_tex, 'ssigma');
M_.param_names_long = char(M_.param_names_long, 'ssigma');
M_.param_names = char(M_.param_names, 'ggamma');
M_.param_names_tex = char(M_.param_names_tex, 'ggamma');
M_.param_names_long = char(M_.param_names_long, 'ggamma');
M_.param_names = char(M_.param_names, 'ppsi');
M_.param_names_tex = char(M_.param_names_tex, 'ppsi');
M_.param_names_long = char(M_.param_names_long, 'ppsi');
M_.param_names = char(M_.param_names, 'ttheta');
M_.param_names_tex = char(M_.param_names_tex, 'ttheta');
M_.param_names_long = char(M_.param_names_long, 'ttheta');
M_.param_names = char(M_.param_names, 'eepsilon');
M_.param_names_tex = char(M_.param_names_tex, 'eepsilon');
M_.param_names_long = char(M_.param_names_long, 'eepsilon');
M_.param_names = char(M_.param_names, 'pphi');
M_.param_names_tex = char(M_.param_names_tex, 'pphi');
M_.param_names_long = char(M_.param_names_long, 'pphi');
M_.param_names = char(M_.param_names, 'ppi');
M_.param_names_tex = char(M_.param_names_tex, 'ppi');
M_.param_names_long = char(M_.param_names_long, 'ppi');
M_.param_names = char(M_.param_names, 'rrhoa');
M_.param_names_tex = char(M_.param_names_tex, 'rrhoa');
M_.param_names_long = char(M_.param_names_long, 'rrhoa');
M_.param_names = char(M_.param_names, 'ssiga');
M_.param_names_tex = char(M_.param_names_tex, 'ssiga');
M_.param_names_long = char(M_.param_names_long, 'ssiga');
M_.param_names = char(M_.param_names, 'rrhom');
M_.param_names_tex = char(M_.param_names_tex, 'rrhom');
M_.param_names_long = char(M_.param_names_long, 'rrhom');
M_.param_names = char(M_.param_names, 'ssigm');
M_.param_names_tex = char(M_.param_names_tex, 'ssigm');
M_.param_names_long = char(M_.param_names_long, 'ssigm');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 14;
M_.param_nbr = 12;
M_.orig_endo_nbr = 14;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('NK_static');
erase_compiled_function('NK_dynamic');
M_.orig_eq_nbr = 14;
M_.eq_nbr = 14;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 6 20;
 0 7 0;
 0 8 0;
 1 9 21;
 0 10 0;
 2 11 0;
 0 12 0;
 0 13 0;
 0 14 22;
 0 15 23;
 0 16 0;
 3 17 0;
 4 18 0;
 5 19 0;]';
M_.nstatic = 6;
M_.nfwrd   = 3;
M_.npred   = 4;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 5;
M_.ndynamic   = 8;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(14, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(12, 1);
M_.NNZDerivatives = [51; -1; -1];
M_.params( 1 ) = 0.99;
bbeta = M_.params( 1 );
M_.params( 2 ) = 1;
ssigma = M_.params( 2 );
M_.params( 3 ) = 1;
ggamma = M_.params( 3 );
M_.params( 4 ) = 1;
ppsi = M_.params( 4 );
M_.params( 5 ) = 1;
ttheta = M_.params( 5 );
M_.params( 6 ) = 10;
eepsilon = M_.params( 6 );
M_.params( 7 ) = 0.75;
pphi = M_.params( 7 );
M_.params( 8 ) = 0.0;
ppi = M_.params( 8 );
M_.params( 9 ) = 0.95;
rrhoa = M_.params( 9 );
M_.params( 10 ) = 0.01;
ssiga = M_.params( 10 );
M_.params( 11 ) = 0;
rrhom = M_.params( 11 );
M_.params( 12 ) = 0.01;
ssigm = M_.params( 12 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 14 ) = 0;
oo_.steady_state( 4 ) = M_.params(8);
oo_.steady_state( 13 ) = 1;
oo_.steady_state( 5 ) = (1+M_.params(8))/M_.params(1)-1;
oo_.steady_state( 8 ) = (((1+oo_.steady_state(4))^(1-M_.params(6))-M_.params(7))/(1-M_.params(7)))^(1/(1-M_.params(6)))-1;
oo_.steady_state( 12 ) = (1-M_.params(7))/(1-M_.params(7)*(1+oo_.steady_state(4))^M_.params(6))*((1+oo_.steady_state(4))/(1+oo_.steady_state(8)))^M_.params(6);
oo_.steady_state( 7 ) = (1+oo_.steady_state(8))*(M_.params(6)-1)/M_.params(6)/(1+oo_.steady_state(4))*(1-(1+oo_.steady_state(4))^M_.params(6)*M_.params(1)*M_.params(7))/(1-M_.params(1)*M_.params(7)*(1+oo_.steady_state(4))^(M_.params(6)-1));
oo_.steady_state( 3 ) = oo_.steady_state(7);
oo_.steady_state( 2 ) = (oo_.steady_state(7)*1/M_.params(4)*oo_.steady_state(12)^M_.params(2))^(1/(M_.params(2)+M_.params(3)));
oo_.steady_state( 11 ) = oo_.steady_state(2)/oo_.steady_state(12);
oo_.steady_state( 1 ) = oo_.steady_state(11);
oo_.steady_state( 6 ) = M_.params(5)*(1+oo_.steady_state(5))/oo_.steady_state(5)*oo_.steady_state(1)^M_.params(2);
oo_.steady_state( 9 ) = oo_.steady_state(7)*oo_.steady_state(1)^(1-M_.params(2))/(1-(1+oo_.steady_state(4))^M_.params(6)*M_.params(1)*M_.params(7));
oo_.steady_state( 10 ) = oo_.steady_state(1)^(1-M_.params(2))/(1-M_.params(1)*M_.params(7)*(1+oo_.steady_state(4))^(M_.params(6)-1));
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
M_.Sigma_e(2, 2) = 1;
options_.irf = 30;
options_.nograph = 1;
options_.noprint = 1;
options_.order = 1;
var_list_ = char('y','n','m','infl','inflo','mc','w','v','DLm','A');
info = stoch_simul(var_list_);
save('NK_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NK_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NK_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NK_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NK_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NK_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NK_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
