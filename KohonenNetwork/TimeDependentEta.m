function eta = TimeDependentEta( t, eta0, tauSigma )
%TimeDependentEta updates eta in the ordering phase according to time
%(t)
    
    eta = eta0 * exp(-t/tauSigma);

end

