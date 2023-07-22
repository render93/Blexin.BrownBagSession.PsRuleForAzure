# Blexin.BrownBagSession.PsRuleForAzure

Assert-PSRule -Module 'PSRule.Rules.Azure' -InputPath '.\modules\bicep\' -Format File
Assert-PSRule -Module 'PSRule.Rules.Azure' -InputPath '.\modules\bicep\' -Format File -Option .\ps-rule-dev.yaml

=====
TODO
esempio di in-flight analisys con pipeline
=====

lanciare primo giro di test e fare vedere i risultati
file ps-rule-dev.yaml con esclusione regola UseTags
aggiunta regole personalizzate (includeLocal: true)
fare vedere github action
=====

PSRule for Azure: Testiamo la nostra infrastruttura cloud

PSRule for Azure è uno strumento open source che permette di testare la conformità e la sicurezza delle risorse in Azure. Con regole by default e personalizzate, è possibile verificare le best practice, le policy di sicurezza e le configurazioni. Tutto questo per migliora la sicurezza e l'affidabilità della nostra infrastruttura cloud

#https://www.youtube.com/watch?v=bQ3wlYXNvtA&ab_channel=PowerShellConferenceEU

