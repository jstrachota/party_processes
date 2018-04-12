Registrace člena
Zájemce o členství se zaregistruje vyplněním formuláře na webu. Je mu vytvořen uživatelský účet v registru a jsou mu zobrazeny:

* informace o úhradě členského příspěvku
* vyplněná přihláška ve formátu PDF k vytištění, podepsání a podání v listinné podobě
* základní informace o budoucím kontaktu od KrP nebo koordinátora

Tyto informace jsou mu zobrazeny vždy po přihlášení do registru. Jiné funkce kromě zobrazení platebních údajů nemá k dispozici.

Tyto informace dostane také [emailem](https://github.com/svobodni/party_registry/blob/supporters/app/views/member_notifications/registered.text.erb)

Po přijetí úhrady na správný účet se správným variabilním symbolem je platba zaúčtována jako členský příspěvek do republikového a krajského rozpočtu, v registru dojde ke změně stavu na příznivce a zájemci je zaslán [email](https://github.com/svobodni/party_registry/blob/supporters/app/views/member_notifications/paid.text.erb).

Po přijetí přihlášky v listinné formě ji kancelář nahraje do systému.

Krajské předsednictvo vyznačuje v registru informaci o přijetí za člena.

Po splnění všech tří podmínek (přihláška v listinné podobě, zaplacený členský příspěvek, schválení přijetí KrP) dojde v registru ke změně stavu na člena a členovi je zaslán [email](https://github.com/svobodni/party_registry/blob/supporters/app/views/member_notifications/regular.text.erb).

**Alternativní scénáře**

1. Pokud je platba zaslána na špatný účet, vrací kancelář platbu a kontaktuje člena.

2. Pokud je variabilní symbol špatný, pokusí se kancelář dohledat správný a proces pokračuje dál. Pokud se nepodaří platbu identifikovat, vrací kancelář platbu.

3. Pokud zájemce není přijat za člena, vrací kancelář platbu na základě [emailu](https://github.com/svobodni/party_registry/blob/supporters/app/views/office_notifications/return_membership_fee.text.erb) a vnitřní kontroly. Platba musí být odúčtována z republikového a krajského rozpočtu. Zájemci je zaslán [email](https://github.com/svobodni/party_registry/blob/supporters/app/views/member_notifications/rejected.text.erb). Status zájemce je v registru změněn na nezaplacený příznivce. Může znovu požádat o členství, v takovém případě již nemusí zasílat přihlášku v listinné formě, použije se minulá nebo může zaplatit příznivecký příspěvek. Pokud neučiní ani jedno, bude jeho registrace po 30 dnech smazána.

4. Pokud po 10 dnech od vyznečení KrP nemá kancelář přihlášku, posílá se [upomínka KrP](https://github.com/svobodni/party_registry/blob/supporters/app/views/presidium_notifications/missing_application.text.erb)
