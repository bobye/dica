function [chiblik chibtime] = compute_chibevaluation(D,c,test)
  testlen = size(test,2);
  topics = D'; topic_prior = c;
  chiblik = 0; chibtime = 0;
  for jj = 1:testlen
    inds = find(test(:,jj)>0); counts = test(inds,jj);
    words = [];
    for ii = 1:length(inds);
      words = [words repmat(inds(ii),1,counts(ii))];
    end
    tt = tic; chiblik = chiblik + ldae_chibms(words, topics, topic_prior, 1000); time = toc(tt);
    chibtime = chibtime + time;
  end
end
