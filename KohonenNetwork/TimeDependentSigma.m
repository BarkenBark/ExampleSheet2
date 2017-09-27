function sigma = TimeDependentSigma( t, sigma0, tauSigma )
%TimeDependentSigma updates sigma in the ordering phase according to time
%(t)

    sigma = sigma0 * exp(-t/tauSigma);

end

