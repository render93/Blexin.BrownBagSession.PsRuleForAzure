test in locale spiegando la struttura del progetto e il file di configurazione ps-rule1.yaml 
  Assert-PSRule -Module 'PSRule.Rules.Azure' -InputPath '.\modules\bicep\' -Format File -Option .\ps-rule1.yaml

aggiunta esclusione regola e (TODO: suppression)
  Assert-PSRule -Module 'PSRule.Rules.Azure' -InputPath '.\modules\bicep\' -Format File -Option .\ps-rule2.yaml

aggiunte regole personalizzate
  Assert-PSRule -Module 'PSRule.Rules.Azure' -InputPath '.\modules\bicep\' -Format File -Option .\ps-rule3.yaml

validazione in-flight
  far vedere log analytics 

validazione pre-flight
  lanciare action con errore in nome risorsa => action fallisce
  lanciare action con nome corretto = action ok + creazione risorsa