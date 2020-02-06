if !exists(":Abolish")
  echom "Depends on the :Abolish command, from tpope's abolish.vim"
  finish
endif

Abolish -buffer {col,behavi,fav,flav,hon,neighb,rum,lab}our{,s,ed,less,able,ing} {}or{}
Abolish -buffer {cent,met,kilomet,lit,lust,mit,nit,goit,reconnoit,saltpet,spect,theat,tit}re{,s} {}er{}
Abolish -buffer {defen,offen,preten}ce {}se
Abolish -buffer {lik,liv,rat,sal,siz,unshak}eable {}able
Abolish -buffer judgement judgment
Abolish -buffer teh the
Abolish -buffer {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
