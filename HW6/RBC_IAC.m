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
M_.fname = 'RBC_IAC';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('RBC_IAC.log');
M_.exo_names = 'epsA';
M_.exo_names_tex = 'epsA';
M_.exo_names_long = 'epsA';
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'inv');
M_.endo_names_tex = char(M_.endo_names_tex, 'inv');
M_.endo_names_long = char(M_.endo_names_long, 'inv');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'Rf');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rf');
M_.endo_names_long = char(M_.endo_names_long, 'Rf');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_partitions = struct();
M_.param_names = 'bbeta';
M_.param_names_tex = 'bbeta';
M_.param_names_long = 'bbeta';
M_.param_names = char(M_.param_names, 'aalpha');
M_.param_names_tex = char(M_.param_names_tex, 'aalpha');
M_.param_names_long = char(M_.param_names_long, 'aalpha');
M_.param_names = char(M_.param_names, 'ddelta');
M_.param_names_tex = char(M_.param_names_tex, 'ddelta');
M_.param_names_long = char(M_.param_names_long, 'ddelta');
M_.param_names = char(M_.param_names, 'ggamma');
M_.param_names_tex = char(M_.param_names_tex, 'ggamma');
M_.param_names_long = char(M_.param_names_long, 'ggamma');
M_.param_names = char(M_.param_names, 'ttheta');
M_.param_names_tex = char(M_.param_names_tex, 'ttheta');
M_.param_names_long = char(M_.param_names_long, 'ttheta');
M_.param_names = char(M_.param_names, 'rrhoA');
M_.param_names_tex = char(M_.param_names_tex, 'rrhoA');
M_.param_names_long = char(M_.param_names_long, 'rrhoA');
M_.param_names = char(M_.param_names, 'ssigA');
M_.param_names_tex = char(M_.param_names_tex, 'ssigA');
M_.param_names_long = char(M_.param_names_long, 'ssigA');
M_.param_names = char(M_.param_names, 'nDk');
M_.param_names_tex = char(M_.param_names_tex, 'nDk');
M_.param_names_long = char(M_.param_names_long, 'nDk');
M_.param_names = char(M_.param_names, 'A0');
M_.param_names_tex = char(M_.param_names_tex, 'A0');
M_.param_names_long = char(M_.param_names_long, 'A0');
M_.param_names = char(M_.param_names, 'pphi');
M_.param_names_tex = char(M_.param_names_tex, 'pphi');
M_.param_names_long = char(M_.param_names_long, 'pphi');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 10;
M_.param_nbr = 10;
M_.orig_endo_nbr = 10;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('RBC_IAC_static');
erase_compiled_function('RBC_IAC_dynamic');
M_.orig_eq_nbr = 10;
M_.eq_nbr = 10;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 4 0;
 0 5 0;
 0 6 14;
 1 7 0;
 2 8 15;
 0 9 16;
 0 10 0;
 0 11 0;
 3 12 0;
 0 13 17;]';
M_.nstatic = 4;
M_.nfwrd   = 3;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 3;
M_.ndynamic   = 6;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(10, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(10, 1);
M_.NNZDerivatives = [38; -1; -1];
M_.params( 1 ) = 0.99;
bbeta = M_.params( 1 );
M_.params( 2 ) = 0.33;
aalpha = M_.params( 2 );
M_.params( 3 ) = 0.018;
ddelta = M_.params( 3 );
M_.params( 4 ) = 1;
ggamma = M_.params( 4 );
M_.params( 5 ) = 7.98;
ttheta = M_.params( 5 );
M_.params( 10 ) = 0.0;
pphi = M_.params( 10 );
M_.params( 6 ) = 0.974;
rrhoA = M_.params( 6 );
M_.params( 7 ) = 0.01;
ssigA = M_.params( 7 );
M_.params( 8 ) = ((1/M_.params(1)-1+M_.params(3))/M_.params(2))^(1/(1-M_.params(2)));
nDk = M_.params( 8 );
M_.params( 9 ) = 1;
A0 = M_.params( 9 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 8 ) = 1/M_.params(1);
oo_.steady_state( 6 ) = 1/M_.params(1)-1+M_.params(3);
oo_.steady_state( 7 ) = (1-M_.params(2))*M_.params(8)^(-M_.params(2));
oo_.steady_state( 4 ) = ((1-M_.params(2))/M_.params(5)*M_.params(8)^(-(M_.params(2)+M_.params(4)))/(M_.params(8)^(1-M_.params(2))-M_.params(3)))^(1/(1+M_.params(4)));
oo_.steady_state( 5 ) = M_.params(3)*oo_.steady_state(4);
oo_.steady_state( 1 ) = M_.params(8)^(1-M_.params(2))*oo_.steady_state(4);
oo_.steady_state( 3 ) = oo_.steady_state(1)-oo_.steady_state(5);
oo_.steady_state( 2 ) = M_.params(8)*oo_.steady_state(4);
oo_.steady_state( 9 ) = M_.params(9);
oo_.steady_state( 10 ) = 1;
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
options_.hp_filter = 1600;
options_.irf = 40;
options_.nograph = 1;
options_.noprint = 1;
options_.order = 1;
var_list_ = char();
info = stoch_simul(var_list_);
save('RBC_IAC_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('RBC_IAC_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('RBC_IAC_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('RBC_IAC_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('RBC_IAC_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('RBC_IAC_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('RBC_IAC_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
