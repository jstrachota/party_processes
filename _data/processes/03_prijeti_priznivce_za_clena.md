Přijetí příznivce za člena
Zájemce o členství vyplnění přihlášku v registru pod svým stávajícím účtem příznivce. V sekci členství jsou mu zobrazeny:
informace o úhradě členského příspěvku
vyplněná přihláška ve formátu PDF k vytištění, podepsání a podání v listinné podobě
základní informace o budoucím kontaktu od KrP nebo koordinátora

Informace o výši členského příspěvku je uvedena jako minimální částka doplněná o informaci, že ji zájemce může ponížit o již zaplacený příznivecký příspěvek.

Tyto informace dostane také [emailem](https://github.com/svobodni/party_registry/blob/supporters/app/views/member_notifications/supporter_application.text.erb)

Po přijetí úhrady na správný účet se správným variabilním symbolem je platba zaúčtována jako členský příspěvek do republikového a krajského rozpočtu a zájemci je zaslán [email](https://github.com/svobodni/party_registry/blob/supporters/app/views/member_notifications/supporter_paid.text.erb).

Po přijetí přihlášky v listinné formě ji kancelář nahraje do systému.

Krajské předsednictvo vyznačuje v registru informaci o přijetí za člena. Pokud zatím není zaplacený členský příspěvek, je příznivci zaslán [email](https://github.com/svobodni/party_registry/blob/supporters/app/views/member_notifications/supporter_payment_pending.text.erb).

Po splnění všech tří podmínek (přihláška v listinné podobě, zaplacený členský příspěvek, schválení přijetí KrP) dojde v registru ke změně stavu na člena a členovi je zaslán [email](https://github.com/svobodni/party_registry/blob/supporters/app/views/member_notifications/regular.text.erb).

Alternativní scénáře:
Pokud je platba zaslána na špatný účet, vrací kancelář platbu a kontaktuje příznivce.

Pokud je variabilní symbol špatný, pokusí se kancelář dohledat správný a proces pokračuje dál. Pokud se nepodaří platbu identifikovat, vrací kancelář platbu.

Pokud zájemce není přijat za člena, vrací kancelář platbu na základě [emailu] (https://github.com/svobodni/party_registry/blob/supporters/app/views/office_notifications/return_membership_fee.text.erb) a vnitřní kontroly. Platba musí být odúčtována z republikového a krajského rozpočtu. Zájemci je zaslán [email](https://github.com/svobodni/party_registry/blob/supporters/app/views/member_notifications/supporter_rejected.text.erb). Zájemci zůstává v registru status příznivce.

Pokud po 10 dnech od vyznečení KrP nemá kancelář přihlášku, posílá se [upomínka KrP](https://github.com/svobodni/party_registry/blob/supporters/app/views/presidium_notifications/missing_application.text.erb)
