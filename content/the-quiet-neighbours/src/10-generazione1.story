// Prima Generazione – "Le due luci" (1866–1890).
// Pagine della Chronicle: ATOW 1 (Giovinezza), ATOW 13 (Maturità), FotU 12 (Vecchiaia).
// Testo italiano completo, rivisto per coerenza.

:: VSG1Intro [INTRO voice]
  # **GENERAZIONE I: Le due luci**
  ! **Registro Maas – Hester Maas, *8 marzo 1866.***
  > Sepolto oggi il signore della tenuta, nel cimitero sull'argine, con la pioggia. Pochi presenti: i figli, il pastore Kalf, il notaio venuto dalla città, qualche curioso. Il sindaco Wessel ha mandato una corona e si è scusato per la gotta. Fokke Tammer era in fondo, con le mani fasciate, e non ha tolto il cappello.

  > Il signore era un uomo strano, ma pagava i parti puntualmente e non mi ha mai chiamata "la donna". Negli ultimi mesi passava le notti nella torre, una costruzione di mattoni che si era fatto alzare dietro la casa, alta come il campanile; e di notte, dall'argine, si vedevano lampi azzurri alle finestre. Il paese diceva che faceva l'alchimia. Io dicevo che faceva tardi.

  > Ora la torre è chiusa. La serratura, dice il fabbro, è fusa, come se qualcuno l'avesse saldata dall'interno; e dentro non c'è nessuno, perché il suo unico abitante è nella cassa che abbiamo appena calato.

  > Dopo il funerale il notaio ha consegnato a ciascuno dei figli una pagina del diario del padre, staccata e piegata, con il nome sopra. Erano nel testamento. Uno dei figli mi ha mostrato la sua, sulla porta della chiesa, e mi ha chiesto se il padre fosse ancora in sé, quando l'ha scritta. Ho risposto la verità: non lo so.
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G1JournalA:
      include AzzeraTraguardi
      include PosaTraguardi

// Ogni erede riceve in segreto un foglio diverso del Journal: i deliri del padre, che sono indizi.
// Fogli di lunghezza simile: nessuno si tradisce dal tempo di lettura.
::for L in A B C D | Fine
:: G1Journal%L%
  if %L.n% > $players:
    goto G1JournalFine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **Una pagina del diario di tuo padre**
  ! **C'è sopra il tuo nome. La calligrafia è la sua, ma riga dopo riga si fa più incerta.**
  if %L.n% == 1:
    > *11 novembre, notte. L'anello si è acceso da solo. Non l'ho toccato, lo giuro: ero alla finestra, con la pipa spenta. Luce bianca, nessun calore, un ronzio come di api dentro un muro. Poi niente. Io non ho mandato niente, e lei si è accesa lo stesso. Era fatta per mandare, non per ricevere. Che cosa ha ricevuto?*

    > Sotto, un disegno a matita: la torre, l'anello sulla sommità, e una linea tratteggiata che parte dall'anello e finisce, dritta come un filo, in mezzo a una distesa di trattini. La torbiera.
  elif %L.n% == 2:
    > *Tammer non è Tammer. Guardategli le mani. Le ha bruciate quella notte, e il giorno dopo le bende erano asciutte. Ha smesso di bere. Ha smesso di bestemmiare. Ha tagliato più torba in un mese che in un anno, e saluta tutti per nome, anche quelli che odiava. Sua moglie dorme dalla sorella.*

    > Sotto, più piccolo, sottolineato due volte: *Non è cattivo. È peggio: è contento.*
  elif %L.n% == 3:
    > *Sul pavimento della torre, la mattina dopo, c'era il mio orologio. Ma il mio è nel panciotto: l'ho tirato fuori e li ho tenuti tutti e due sul palmo. Uguali. Stesso stemma, stesso graffio sul coperchio. Quello del pavimento è vecchio, consumato, con il vetro incrinato. Come se avesse fatto una guerra.*

    > Sotto, con un'altra penna: *L'ho dato alla levatrice in pagamento. Non lo voglio in casa.*
  else:
    > *È passato qualcosa. Non so che cosa. Non so da dove. Ho fatto i conti cento volte e non tornano: la Macchina non era accesa, quindi nessuno l'ha mandato da qui. Allora chi?*

    > *Qualunque cosa sia, non è sua questa terra. Deve tornare da dove viene. Se io non ci riesco, ditelo ai miei figli. Ditelo ai figli dei miei figli.*
  ! Che cosa fai del foglio?
  [[Lo tieni per te, tra le tue carte. ~> tieni]]
  [[Lo leggi a tutti, a colazione. ~> leggi]]
  fragment tieni:
    > Pieghi il foglio in quattro e lo infili tra le tue carte. È tuo, dopotutto: c'è il tuo nome sopra. Agli altri racconterai quello che vorrai, quando vorrai. Per ora ti sembra soltanto il delirio di un vecchio solo, chiuso in una torre a parlare con i suoi ingranaggi.
    block setupEvent next=G1Journal%L.next%:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge). Puoi raccontare agli altri quello che hai letto, tutto, in parte o per niente.
  fragment leggi:
    > La mattina dopo, a colazione, leggi il foglio ad alta voce. Qualcuno ride, poi smette. Qualcuno scuote la testa: il padre, negli ultimi mesi, non stava bene, lo sapevano tutti. Qualcun altro non dice niente e guarda la torre dalla finestra.
    block setupEvent next=G1Journal%L.next%:
      ! Leggi ad alta voce agli altri giocatori il testo in corsivo qui sopra. Guadagni 1VP.
::endfor

:: G1JournalFine
  # **Il mattino dopo**
  > La tenuta è una casa lunga e bassa ai margini del paese, con il tetto di canne e le finestre verso la torbiera. Dietro la casa c'è la torre: mattoni rossi, nessuna finestra fino a metà altezza, e in cima una stanza con quattro vetrate, chiusa. Al mattino ci si posano i corvi. Non ci restano a lungo.

  > {$townname} è un paese di torbai: un centinaio di case di legno intorno alla chiesa, un mercato, un mulino, un argine che tiene lontano il fiume, e tutt'intorno la torbiera, piatta e scura fino all'orizzonte, dove d'inverno sale la nebbia e d'estate le zanzare. Da secoli la gente di qui taglia la torba a mattoni, la fa seccare e la brucia. La torba scalda poco e fuma molto. Ma è gratis, ed è di tutti.

  > A metà mattina qualcuno bussa al cancello. È Fokke Tammer, il torbaio, con le mani fasciate e una carriola piena di mattoni di torba scura, quasi nera. Li offre in dono, "per la famiglia del signore, in segno di rispetto". Dice che questa torba scalda meglio di qualsiasi altra. Dice che non fa fumo. Sorride: in paese nessuno ricorda di averlo mai visto sorridere.
  ! Che cosa fate? *(Decidete insieme.)*
  [[Lo fate entrare e accettate il dono. ~> entra]]
  [[Ringraziate e lo rimandate a casa. ~> via]]
  fragment entra:
    set fiducia = $fiducia + 1
    > Fokke entra, si siede in cucina e accetta un bicchiere d'acqua, non di gin. Parla del signore con affetto, del tempo, della torba. Quando la cuoca accende il fuoco con i suoi mattoni, la fiamma è bassa e silenziosa e la stanza si scalda in pochi minuti. Fokke non si avvicina mai al camino. Si tiene le mani in grembo, e se ne va ringraziando tre volte.
    block setupEvent next=G1R1:
      ! Ogni giocatore guadagna $1: la torba di Fokke vi fa risparmiare legna per tutto l'inverno.
  fragment via:
    set fiducia = $fiducia - 1
    > Lo ringraziate dal cancello e gli dite che non serve. Fokke non insiste, non si offende. Annuisce, gira la carriola e se ne va per l'argine, piano. Dopo cento passi si ferma, si volta e resta a guardare la torre per un lungo momento, come si guarda una casa dove si è vissuti da bambini.
    block setupEvent next=G1R1:
      ! Ogni giocatore guadagna 1 Prova {icon:S3_WeaponToken}.

:: G1R1 [HUB]
  # **I VICINI SILENZIOSI – Giovinezza**
  set round = 1
  if $hub != "G1R1":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Aprite la Village Chronicle alla sezione **A Time of War** ({icon:S3_ScenarioIcon}) e andate a **pagina 1**.
      include PreparaFolla
      set _SetupImage = "S3_WeaponToken"
      ! Prendete dalla Scatola di **A Time of War** i **Weapon token** {icon:S3_WeaponToken} e metteteli accanto al tabellone: in questo scenario sono le **Prove**. Le Prove non valgono punti a fine partita.
  set hub = "G1R1"
  include VociComuni
  if !$evFokke:
    block hubTitle:
      ! {icon:Storybook} **La torba di Fokke – Farmer's Market**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Farmer's Market [[clicca qui. -> G1Fokke]]
  if !$evCane:
    block hubTitle:
      ! {icon:Storybook} **Il cane del torbaio – Park**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Park [[clicca qui. -> G1Cane]]
  if !$evLevatrice:
    block hubTitle:
      ! {icon:Storybook} **La levatrice – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G1Levatrice]]
  if !$evTorre:
    block hubTitle:
      ! {icon:Storybook} **La serratura fusa – Builder's Office**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Builder's Office [[clicca qui. -> G1Torre]]
  if !$evTomba:
    block hubTitle:
      ! {icon:Storybook} **La tomba del padre – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G1Tomba]]
  if !$evWessel1:
    block hubTitle:
      ! {icon:Storybook} **Il sindaco con la gotta – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G1Wessel]]
  if !$evCarovana:
    block hubTitle:
      ! {icon:Storybook} **L'acqua della stella – Traveling Caravan**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Traveling Caravan [[clicca qui. -> G1Carovana]]
  block hubTitle:
    ! **Evento del primo Round**
  block hubDetails:
    > Al mercato non si parla d'altro che delle due luci. Il mugnaio giura che erano fuochi fatui, il maestro che era una stella cadente, la vedova Brink che era il diavolo venuto a prendersi il signore della tenuta e che, non trovandolo pronto, ha aspettato quattro mesi.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    include SetePietra
    ui endOfRound progress="G1R1" next="G1Asta"

::round G1R1 1
fine: La Giovinezza della Prima Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Maturità prima di continuare.

:: G1Fokke
  set evFokke = true
  # **La torba di Fokke**
  > Al Farmer's Market, tra le ceste di aringhe e i formaggi, c'è il banco di Fokke Tammer, e davanti al banco c'è la fila. Vende la sua torba nuova, quella nera, a mezzo soldo il mattone: brucia piano, non fa fumo, e dicono che una sola pila basti per una settimana. Gli altri torbai lo guardano storto, con le mani in tasca e i carretti pieni di torba normale che nessuno compra.

  > Fokke serve tutti con pazienza, senza alzare la voce, e dà il resto giusto fino all'ultimo centesimo, lui che un anno fa non sapeva contare oltre dieci. Le bende sulle mani sono pulite. Quando ti vede sorride e ti fa cenno di passare avanti: "Per la famiglia del signore non si fa la fila."
  ! Che cosa fai?
  [[Compri la torba ($1). ~> compra]]
  [[Gli chiedi di togliersi le bende. ~> mani]]
  [[Chiedi agli altri torbai che cosa ne pensano. ~> torbai]]
  fragment compra:
    set fiducia = $fiducia + 1
    > Compri una pila di mattoni neri, e Fokke te la fa portare a casa da un ragazzo. Brucia esattamente come ha promesso: senza fumo, senza scoppi, per giorni. In casa fa così caldo che d'inverno si dorme con le finestre aperte. Si dorme benissimo, del resto. Nessuno, in famiglia, si ricorda più i sogni.
    block setupEvent next=$hub:
      ! Paga $1 e guadagni 2VP.
  fragment mani:
    > Fokke ti guarda un momento, poi srotola le bende senza una parola, davanti a tutti. Sotto non c'è nessuna bruciatura. La pelle dei palmi è liscia, rosa, perfetta come quella di un neonato. Le linee della mano, quelle che la zingara del mercato legge per un soldo, non ci sono più. Fokke si riavvolge le bende, con cura, e ti augura buona giornata.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.
  fragment torbai:
    set ronda = $ronda + 1
    > I torbai ti offrono un sorso di gin e molte opinioni. La torba nera, dicono, viene dal punto della luce, dove nessuno di loro mette piede. Fokke ci va da solo, di notte, e torna con il carretto pieno e i vestiti asciutti. "Fokke era il peggiore di tutti noi", dice il più vecchio. "Adesso è il migliore. Non mi piace."
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken}.

:: G1Cane
  set evCane = true
  # **Il cane del torbaio**
  > Nel Park, sotto il salice vicino allo stagno, c'è un grosso cane nero, magro, con il pelo incrostato di fango. È Bruin, il cane di Fokke Tammer: lo conoscono tutti, perché per dieci anni ha seguito il padrone dall'osteria a casa, ogni notte, tenendolo in piedi. Da quando Fokke è "guarito", Bruin non torna a casa. Dorme sotto il salice, mangia quello che gli tirano i bambini, e quando Fokke passa sulla strada gli ringhia contro, con il pelo dritto sulla schiena, finché non è sparito.
  ! Che cosa fai?
  [[Porti Bruin alla tenuta. ~> prendi]]
  [[Lo riporti a Fokke. ~> riporta]]
  fragment prendi:
    set cane = "preso"
    set fiducia = $fiducia - 1
    > Bruin ti segue senza bisogno di guinzaglio, come se ti aspettasse. Alla tenuta mangia per tre, dorme davanti alla porta della torre e non abbaia mai, a nessuno. Tranne a certe persone, quando passano sulla strada. Impari presto a fare attenzione a chi sono.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Animal_Icon} e 1 Prova {icon:S3_WeaponToken}.
  fragment riporta:
    set cane = "riportato"
    set fiducia = $fiducia + 1
    > Porti Bruin a casa di Fokke, con una corda al collo. Il cane punta le zampe per tutta la strada. Fokke lo ringrazia, ti offre un caffè, e chiude la porta. Il giorno dopo Bruin non c'è più: Fokke dice che è scappato. La settimana dopo, al mercato, Fokke ha un cane nuovo, nero, grosso, identico. Non ringhia a nessuno.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G1Levatrice
  set evLevatrice = true
  # **La levatrice**
  > In chiesa, dopo il battesimo del figlio del mugnaio, Hester Maas ti prende da parte. È una donna asciutta e alta, con la borsa di cuoio sempre in mano e l'aria di chi ha visto nascere mezzo paese e morire l'altro mezzo. Dalla borsa tira fuori un orologio da taschino d'argento: vecchio, consumato, con il vetro incrinato e lo stemma della tenuta inciso sul coperchio.

  > "Me l'ha dato vostro padre, in pagamento dell'ultima visita", dice. "Ha detto che era il suo. Ma il suo ce l'aveva nel panciotto, l'ho visto io: nuovo, lucido, con lo stesso stemma. Questo l'ha trovato sul pavimento della torre. Non lo voglio, se è roba vostra." L'orologio è fermo sulle undici e un quarto.
  ! Che cosa fai?
  [[Le offri di ricomprarlo. ~> compra]]
  [[Le dici di tenerlo. ~> tieni]]
  [[Le chiedi di annotare tutto quello che vede. ~> annota]]
  fragment compra:
    > Hester rifiuta il denaro, offesa: era un pagamento, e lei è una donna onesta. Ti lascia però guardare l'orologio da vicino. Dentro il coperchio, sotto lo stemma, qualcuno ha inciso con la punta di un coltello delle iniziali e una data, ma il metallo è così consumato che non si legge più niente. Il meccanismo è di una fattura che non hai mai visto: più fine, più fitto. Più moderno.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e 1 Conoscenza Ingegneristica (Engineering Knowledge).
  fragment tieni:
    > Hester annuisce, rimette l'orologio nella borsa e lo porta a casa, dove lo chiude nel cassetto del Registro, insieme ai certificati di nascita e alle ricevute. Da quel giorno, quando ti incontra per strada, ti saluta per prima.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment annota:
    set hester = true
    set ronda = $ronda + 1
    > Hester ti guarda a lungo. Poi dice che lo fa già: le temperature, le guarigioni, le mani fredde. Non sa perché, dice: le sembra soltanto che qualcuno, un giorno, ne avrà bisogno. Ti promette che non salterà un nome.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken}.

:: G1Torre
  set evTorre = true
  # **La serratura fusa**
  > Al Builder's Office il capomastro Lambert ti mostra il suo disegno della porta della torre, preso con la carta lucida: ferro battuto, tre serrature, cardini da fortezza. Ha mandato due garzoni con le leve e un fabbro con la lima. La porta non si è mossa di un capello. "La serratura è fusa dall'interno", dice. "Qualcuno l'ha saldata con un calore che non si fa con il carbone. E vostro padre era fuori, quando è morto: l'abbiamo trovato ai piedi della torre, con la chiave in mano."
  ! Che cosa fai?
  [[Paghi Lambert per sfondare il muro ($2). ~> forza]]
  [[Lasci la torre chiusa, per ora. ~> lascia]]
  fragment forza:
    set torre = true
    > I garzoni lavorano due giorni con lo scalpello, e alla fine aprono un buco nel muro grande quanto un pugno, all'altezza della scala. Dentro è buio. Lambert ci accosta l'orecchio e diventa bianco: dentro, dice, qualcosa ronza, piano, come un alveare. Poi smette. I garzoni non vogliono più tornare.
    block setupEvent next=$hub:
      ! Paga $2. Guadagni 1 Conoscenza Ingegneristica (Engineering Knowledge) e 1VP.
  fragment lascia:
    > Lambert è sollevato, e non lo nasconde. Ti fa pagare solo la mezza giornata dei garzoni, e ti consiglia di lasciare le cose dei morti ai morti. Uscendo dall'ufficio ti accorgi che anche lui ha le mani bendate. Si è scottato, dice, con la stufa.
    block setupEvent next=$hub:
      ! Guadagni $1.

:: G1Tomba
  set evTomba = true
  # **La tomba del padre**
  > Il cimitero di {$townname} è costruito sull'argine, l'unico punto asciutto del paese, e anche lì, a un metro di profondità, si trova l'acqua. Le tombe nuove si riempiono in una notte. Il becchino Siebe, un uomo minuto con una gamba più corta dell'altra, ti aspetta accanto alla fossa del padre, ancora coperta di terra smossa.

  > Fokke Tammer, ti dice, si è offerto di coprire la tomba con la sua torba nera, gratis: la torba della torbiera, dicono i vecchi, conserva i morti per sempre, e il signore della tenuta merita di essere conservato. Siebe aspetta una risposta, appoggiato alla vanga. Ha l'aria di chi spera che tu dica di no.
  ! Che cosa fai?
  [[Accetti la torba di Fokke. ~> torba]]
  [[Paghi una lastra di pietra ($2). ~> pietra]]
  fragment torba:
    set tomba = "torba"
    set fiducia = $fiducia + 1
    > Fokke porta la torba lui stesso, il giorno dopo, e la stende sulla fossa con le sue mani bendate, mattone per mattone, come si rimbocca una coperta. Quando ha finito resta in ginocchio un momento, a guardare. Siebe dice che a {$townname} non si è mai vista una tomba così ben fatta.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment pietra:
    set tomba = "pietra"
    > Siebe fa portare una lastra di granito dalla città, pesante, liscia, con il nome del padre e le due date. Ci vogliono quattro uomini per metterla al suo posto. Quando hanno finito Siebe ti stringe la mano, sollevato: "Così sta giù", dice. Poi arrossisce, come se avesse detto troppo.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 2VP.

:: G1Carovana
  set evCarovana = true
  # **L'acqua della stella**
  > Alla Traveling Caravan, tra un dentista ambulante e un uomo che vende almanacchi, c'è un carro dipinto di blu con una scritta a lettere d'oro: ACQUA DELLA STELLA – DA BRUNVEEN – GUARISCE OGNI MALE. Il venditore è un ometto con il cilindro sfondato, che non è di qui. Vende boccette di acqua scura a un fiorino l'una, e in paese ne ha vendute già cinquanta. La attinge, dice ridendo, "dove è caduta la stella".
  ! Che cosa fai?
  [[Ne compri una boccetta ($1). ~> compra]]
  [[Lo denunci al sindaco. ~> denuncia]]
  [[Lo segui, la notte. ~> segui]]
  fragment compra:
    set carovana = "comprata"
    set vicini = $vicini + 1
    > La boccetta è di vetro verde, con il tappo di sughero e un'etichetta disegnata a mano: una stella che cade su un prato. A casa la stappi e annusi: fumo, terra, ferro. Nel tuo laboratorio l'acqua resta torbida per settimane, senza mai depositarsi, e ogni tanto, quando nessuno la guarda, il livello si abbassa di un dito.
    block setupEvent next=$hub:
      ! Paga $1 e guadagni 1 {icon:Chemical_Icon} e 1 Conoscenza Chimica (Chemistry Knowledge).
  fragment denuncia:
    set carovana = "denunciata"
    set fiducia = $fiducia - 1
    > Il sindaco Wessel ascolta la tua denuncia con grande attenzione e promette di occuparsene. Il giorno dopo il carro blu non c'è più. In paese dicono che il venditore sia partito di notte, senza pagare l'oste. Sul suo letto, alla locanda, la padrona ha trovato soltanto un mucchio di torba bagnata, con la forma di un uomo.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Creepy_Icon}.
  fragment segui:
    set carovana = "seguita"
    > Lo segui fino all'argine, nel buio, tenendoti lontano. L'ometto entra nella torbiera fino alle ginocchia, nel punto esatto della luce, e riempie le boccette una per una, cantando. Poi smette di cantare. Resta immobile nell'acqua per un'ora intera, con le braccia lungo i fianchi, come se ascoltasse qualcuno. Quando esce, il cilindro è sparito, e cammina dritto, senza zoppicare.
    block setupEvent next=$hub:
      ! Guadagni 2 Prove {icon:S3_WeaponToken} e 1 {icon:Insanity_Icon}.

// L'asta della pietra (Crown token).
:: G1Asta
  # **La pietra all'asta**
  ui specialEvent
  ! **Registro Maas – Hester Maas, *1866.***
  > Oggi Fokke Tammer ha portato al mercato la cosa che ha trovato nell'acqua, quella delle sue ustioni. L'aveva tenuta nascosta nel capanno. È una pietra nera, liscia, grande come una pagnotta, più pesante di quanto sembra; e calda, sempre, anche sotto la pioggia. Chi la tocca dice che dà sete.

  > Fokke la mette all'asta. Dice che non è giusto che la tenga lui: deve andare "a chi saprà cosa farne". Il professore del museo della città è arrivato con il treno del mattino e il portafoglio gonfio. Ma tutti, al mercato, guardavano la famiglia della tenuta.
  set _SetupImage = "S3_CrownToken"
  ! Ogni giocatore offre in segreto una somma di denaro. Chi offre di più paga e prende la **pietra**: il **Crown token** {icon:S3_CrownToken} della Scatola di **A Time of War**. Gli altri non pagano niente. *(In caso di parità vince, tra i pari, il primo in ordine di turno.)*
  ! Chi ha la pietra, una volta per Round, quando pesca Esperimenti ne pesca uno in più. Ma a fine Round, ogni volta, la pietra gli fa venire sete.
  [[Clicca per iniziare l'asta... ~> 0]]
  fragment 0:
    ui bidding next="G1AstaEsito" mode="Bidding"

:: G1AstaEsito
  set dopo = "G1AstaVinta"
  ! Chi ha vinto l'asta?
  [[Clicca per scegliere... => ChiSei]]

:: G1AstaVinta
  set pietra = "famiglia"
  set pietraChi = $chi
  set pietraNome = $nomeChi
  # **La pietra**
  > Fokke ti consegna la pietra avvolta in un sacco di juta, con entrambe le mani, come si consegna un bambino. Ti raccomanda di tenerla all'asciutto. Poi, piano, perché senta soltanto tu: "Non la lasci mai vicino all'acqua. Lei vuole tornare."

  > A casa la pietra è calda sul tavolo del laboratorio, e la stanza, in pochi minuti, si riempie di un odore di torbiera. Sulla superficie liscia non si vede un graffio, una venatura, un difetto. Non è un minerale che tu conosca. Quella notte ti alzi tre volte a bere.
  block setupEvent next=G1Ostrander:
    ! **{$pietraNome}** prende il Crown token {icon:S3_CrownToken} e lo tiene davanti a sé.

:: G1R2 [HUB]
  # **I VICINI SILENZIOSI – Maturità**
  set round = 2
  if $hub != "G1R2":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Girate la Village Chronicle a **pagina 13**.
      set luogo = "Farmer's Market"
      include PosaVicino
      ! *È Fokke Tammer: è il primo.*
      set pozzi = $pozzi + 1
      set _SetupImage = "S3_ParadoxToken"
      ! Prendete dalla Scatola di **A Time of War** i **Paradox token** {icon:S3_ParadoxToken}: in questo scenario sono **l'acqua scura** della torbiera. Mettetene uno sul **Park**.
  set hub = "G1R2"
  include VociComuni
  if !$evMani:
    block hubTitle:
      ! {icon:Storybook} **Le temperature – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G1Mani]]
  if !$evPozzo:
    block hubTitle:
      ! {icon:Storybook} **Il canale – Laborer's Union**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Laborer's Union [[clicca qui. -> G1Pozzo]]
  if !$evPastore:
    block hubTitle:
      ! {icon:Storybook} **La predica – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G1Pastore]]
  if !$evFabbro:
    block hubTitle:
      ! {icon:Storybook} **Il fabbro che non sbaglia – Blacksmith**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Blacksmith [[clicca qui. -> G1Fabbro]]
  if !$evFosse:
    block hubTitle:
      ! {icon:Storybook} **Le fosse piene – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G1Fosse]]
  if !$evMugnaio:
    block hubTitle:
      ! {icon:Storybook} **La moglie del mugnaio – Traveling Caravan**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Traveling Caravan [[clicca qui. -> G1Mugnaio]]
  block hubTitle:
    ! **Evento del secondo Round**
  block hubDetails:
    > Quest'anno a {$townname} non è morto nessuno. Il becchino Siebe, per arrotondare, si è messo a fare anche il falegname, e il pastore Kalf ha celebrato più matrimoni che in tutti gli anni precedenti messi insieme. Le coppie si sposano senza fretta, senza litigi, e senza invitare i parenti di fuori.
    if $cane == "preso":
      > Alla tenuta, Bruin, il cane di Fokke, ha preso l'abitudine di sedersi davanti al cancello ogni volta che passa un corteo nuziale, e di ringhiare, piano, a uno solo dei due sposi. Mai a tutti e due.
    if $pietra == "famiglia":
      > Alla tenuta, intanto, la pietra di {$pietraNome} scalda la cassetta di feltro, e nel laboratorio le caraffe d'acqua si svuotano ogni notte.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    include SetePietra
    ui endOfRound progress="G1R2" next="G1Cronaca"

::round G1R2 2
fine: La Maturità della Prima Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Vecchiaia prima di continuare.

:: G1Mani
  set evMani = true
  # **Le temperature**
  > Al Town Hall il consiglio si riunisce il primo giovedì del mese, in una sala con le pareti di legno e un ritratto del re. Oggi Hester Maas ha chiesto la parola, cosa che una levatrice non fa mai. Ha portato il suo Registro. Legge ad alta voce: nove persone, in paese, hanno la temperatura del corpo più bassa del normale di due gradi interi. Tutte e nove stanno benissimo. Tutte e nove hanno bevuto acqua della torbiera.

  > Il sindaco Aldert Wessel la ascolta con le mani incrociate sulla pancia. È un uomo grosso e rosso, con la gotta e una tosse che non passa. Quando Hester ha finito, la ringrazia per lo zelo e le chiede se abbia anche una malattia da segnalare, oppure soltanto della buona salute.
  ! Che cosa fai?
  [[La sostieni davanti al consiglio. ~> sostieni]]
  [[Le chiedi i nomi, in privato. ~> nomi]]
  [[Fai una battuta e sciogli la tensione. ~> battuta]]
  fragment sostieni:
    set ronda = $ronda + 1
    set fiducia = $fiducia - 1
    set hester = true
    > Ti alzi e dici che la levatrice ha ragione, e che il consiglio dovrebbe vietare l'acqua della torbiera finché non si sa che cos'è. Il silenzio dura a lungo. Poi il sindaco ringrazia anche te, mette ai voti la proposta e la proposta perde: tutti contrari, tranne voi due. I consiglieri che hanno votato contro ti sorridono, uscendo, uno per uno.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Creepy_Icon}.
  fragment nomi:
    > Fuori, sotto il portico, Hester ti mostra la pagina. Il primo nome è Fokke Tammer. Poi il capomastro Lambert, la lavandaia Smit, due torbai, un garzone del fabbro, il ragazzo dei Mulder, la moglie del mugnaio, e l'ultimo, scritto la settimana scorsa, con un punto di domanda: Wessel, Aldert, sindaco.
    block setupEvent next=$hub:
      ! Guadagni 2 Prove {icon:S3_WeaponToken}.
  fragment battuta:
    set fiducia = $fiducia + 1
    > Dici che, se la buona salute fosse una malattia, a {$townname} ci sarebbe un'epidemia, e il consiglio ride, tutto insieme, troppo a lungo. Hester chiude il Registro e se ne va senza salutarti. Il sindaco, invece, ti invita a cena.
    block setupEvent next=$hub:
      ! Guadagni $2.

:: G1Pozzo
  set evPozzo = true
  # **Il canale**
  > Al Laborer's Union, la stanza sopra la stalla dove si assumono i braccianti a giornata, l'acqua per bere la portano da un canale che arriva dritto dalla torbiera. Fino all'anno scorso nessuno la toccava: sapeva di ruggine e dava il mal di pancia. Adesso tutti la bevono, perché è buona, fresca, e toglie la fatica. I braccianti lavorano dall'alba al tramonto senza lamentarsi. Il capo del sindacato è preoccupato: da sei mesi nessuno chiede più un aumento.
  ! Che cosa fai?
  [[Paghi per chiudere il canale e scavare un pozzo ($2). ~> chiudi]]
  [[Assaggi. ~> assaggi]]
  fragment chiudi:
    set vicini = $vicini - 1
    > Il pozzo nuovo costa caro e dà un'acqua dura, che sa di calce. I braccianti brontolano, tossiscono, si lamentano del caldo e della paga. Il capo del sindacato ti ringrazia con le lacrime agli occhi.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 1VP.
  fragment assaggi:
    set vicini = $vicini + 1
    > È davvero buona. È fredda come la neve sciolta, e lascia in bocca un sapore di fumo che non è sgradevole. Per tutto il pomeriggio lavori senza stancarti, e la sera non ricordi bene a che cosa hai pensato. A niente di brutto, comunque.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Biologica (Biology Knowledge).

:: G1Pastore
  set evPastore = true
  # **La predica**
  > La chiesa di {$townname} è di legno, come tutto il resto, con il campanile storto e le panche consumate. Il pastore Ewout Kalf è un uomo magro e severo, con la voce più grande di lui. Questa domenica predica sulla moglie di Lot e sulle cose che non bisogna guardare. Poi, senza cambiare tono, parla della pietra della torbiera: viene dal cielo, dice, e quello che viene dal cielo senza essere chiamato non viene da Dio. Va riportata dove l'hanno trovata. Mentre parla, guarda la vostra panca.
  ! Che cosa fai?
  [[Dopo la funzione, gli dai ragione. ~> ragione]]
  [[Lo contraddici, sul sagrato. ~> contraddici]]
  fragment ragione:
    set ronda = $ronda + 1
    set kalf = $kalf + 1
    > Il pastore ti stringe la mano tra le sue, a lungo, come si stringe quella di un convertito. Ti dice che non sei l'unica persona a pensarla così, a {$townname}, ma che siete pochi, e ogni mese di meno. Ti chiede di pregare per loro. Non dice per chi.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment contraddici:
    set fiducia = $fiducia + 1
    set kalf = $kalf - 1
    > Gli rispondi, davanti a tutti, che una pietra è una pietra, e che la scienza non si fa con le prediche. Il pastore diventa rosso, poi bianco. Intorno, la gente annuisce, educata: molti più di quanti ti aspettassi. Hanno tutti le mani in tasca.
    block setupEvent next=$hub:
      ! Guadagni $2.

:: G1Fabbro
  set evFabbro = true
  # **Il fabbro che non sbaglia**
  > Jaap Mol, il fabbro, è caduto nel canale della torbiera a Pasqua, ubriaco, ed è rimasto sott'acqua finché i garzoni non l'hanno ripescato, mezz'ora dopo, dato per morto. Si è rialzato da solo, si è scosso l'acqua di dosso ed è tornato a lavorare. Da allora non sbaglia un colpo. I ferri di cavallo che fa sono così perfetti che i cavalli della città vengono a ferrarsi a {$townname}. Jaap non beve più, non canta più, e ha chiesto scusa a tutti quelli a cui doveva dei soldi.
  ! Che cosa fai?
  [[Gli ordini una chiave per la torre. ~> chiave]]
  [[Gli chiedi che cosa ricorda del canale. ~> canale]]
  fragment chiave:
    set chiave = true
    > Jaap guarda il tuo disegno della serratura, lo gira, e dice che non si può aprire con una chiave una porta saldata. Ma che si può fare una chiave che la scaldi, dall'esterno, fino a fonderla di nuovo. Ci lavora tre giorni. Il risultato è un ferro lungo come un braccio, con il manico di legno e la punta di rame. Lo consegna senza farsi pagare: "Per vostro padre", dice. "Era un brav'uomo."
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Gears_Icon} e 1 Conoscenza Ingegneristica (Engineering Knowledge).
  fragment canale:
    > Jaap ci pensa, martellando. Ricorda il freddo, dice, e poi il buio, e poi un gran silenzio, come in chiesa quando il pastore smette di parlare. E qualcuno, laggiù, che gli somigliava, e che dormiva. "L'ho lasciato dormire", dice. "Era stanco. Io no." Poi riprende a martellare, e non sbaglia un colpo.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Insanity_Icon}.

:: G1Fosse
  set evFosse = true
  # **Le fosse piene**
  > Al cimitero sull'argine il becchino Siebe ha un problema. Ha dovuto spostare tre tombe vecchie per fare posto al muro nuovo, e le casse, aperte, erano piene d'acqua scura. Dentro, i morti di vent'anni fa: intatti, la pelle bruna come cuoio, i vestiti della festa, le mani giunte. Come se dormissero. Siebe ne ha visti tanti, dice: è la torba, che conserva tutto. Ma nella terza fossa, sotto la cassa, nell'acqua, c'era un'altra faccia, giovane, bianca, con gli occhi chiusi, che nessuno ha mai sepolto lì. Siebe giura che era la moglie del mugnaio. La moglie del mugnaio, stamattina, era al mercato.
  ! Che cosa fai?
  [[Aiuti Siebe a riseppellirli. ~> seppellisci]]
  [[Chiami Hester a esaminarli. ~> esamina]]
  fragment seppellisci:
    > Li riseppellite al tramonto, in fretta, con la terra asciutta portata dalla collina, perché l'acqua non li raggiunga. Nella terza fossa, prima di riempirla, Siebe non guarda, e recita una preghiera che non è nel libro del pastore. Quando avete finito si lava le mani tre volte nella fontana, e ti chiede di non dirlo a nessuno.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment esamina:
    set hester = true
    > Hester arriva con la borsa e la lanterna. Nella terza fossa l'acqua si è intorbidita, e la faccia non si vede più. Hester ci immerge il termometro, aspetta, e lo tira fuori: l'acqua, laggiù, è tiepida come un corpo che dorme. Lo annota sul Registro, poi chiude il quaderno e dice che non ha visto niente, e che è meglio così.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.

:: G1Cronaca
  # **Una pagina del Registro**
  ! **Registro Maas – Hester Maas, *1870.***
  > Quattro anni dalla notte delle due luci. Nessuno, a {$townname}, è morto di malattia da allora: soltanto due vecchi, nel sonno, e un bambino caduto dal fienile. Le febbri di palude, che ogni estate si portavano via qualcuno, quest'anno non sono venute. Il medico della città dice che è merito dell'aria. Io conto le temperature.

  > Le mani fredde, nel Registro, sono quarantuno. Ho smesso di dirlo al consiglio.
  if $cane == "preso":
    > Il cane di Fokke Tammer vive alla tenuta, e ringhia alle stesse persone che segno sul Registro. Ho cominciato a portarlo con me, quando faccio il giro delle case. Non sbaglia mai.
  elif $cane == "riportato":
    > Il cane nuovo di Fokke Tammer, quello identico al vecchio, segue il padrone ovunque, senza un rumore. Non abbaia, non mangia, non invecchia. I bambini non ci giocano più.
  if $carovana == "comprata":
    > L'acqua della stella, quella del venditore con il cilindro, si trova ormai in ogni cucina. Una delle boccette, mi dicono, è sul tavolo del laboratorio della tenuta.
  elif $carovana == "denunciata":
    > Il venditore dell'acqua della stella è sparito, ma l'acqua no: adesso la vende il figlio dell'oste, con la stessa etichetta.
  elif $carovana == "seguita":
    > Il venditore dell'acqua della stella è tornato quest'anno, senza cilindro, senza zoppia, e senza l'accento di prima. Parla come noi.
  if $tomba == "torba":
    > Sulla tomba del signore della tenuta la torba di Fokke non ha fatto erba, né muschio. È nera e liscia come il primo giorno.
  elif $tomba == "pietra":
    > La lastra di granito sulla tomba del signore si è inclinata di un dito, come se sotto qualcosa spingesse. Siebe dice che è il terreno che si assesta.
  if $fiducia > 1:
    > La famiglia della tenuta è benvoluta, ormai. Li invitano alle feste, li salutano per nome. Ho paura per loro.
  elif $fiducia < -1:
    > La famiglia della tenuta fa domande, e il paese ha smesso di rispondere. Li salutano lo stesso, sempre gentili. Nessuno, però, va più a trovarli.
  [[Continua... => G1R3]]

:: G1R3 [HUB]
  # **I VICINI SILENZIOSI – Vecchiaia**
  set round = 3
  if $hub != "G1R3":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 12**.
      set luogo = "Town Hall"
      include PosaVicino
      ! *È il sindaco Aldert Wessel.*
      set pozzi = $pozzi + 1
      set _SetupImage = "S3_ParadoxToken"
      ! Mettete un token {icon:S3_ParadoxToken} sul **Farmer's Apprentice**.
  set hub = "G1R3"
  include VociComuni
  if !$evBanca:
    block hubTitle:
      ! {icon:Storybook} **Il professore del museo – Bank**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Bank [[clicca qui. -> G1Banca]]
  if !$evLibri:
    block hubTitle:
      ! {icon:Storybook} **I libri del pastore – Church Library**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church Library [[clicca qui. -> G1Libri]]
  if !$evSindaco:
    block hubTitle:
      ! {icon:Storybook} **Il sindaco guarito – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G1Sindaco]]
  if !$evFonderia:
    block hubTitle:
      ! {icon:Storybook} **Il conto della fonderia – Foundry**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Foundry [[clicca qui. -> G1Fonderia]]
  if !$evApprendista:
    block hubTitle:
      ! {icon:Storybook} **Il ragazzo dei Brink – Farmer's Apprentice**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Farmer's Apprentice [[clicca qui. -> G1Apprendista]]
  if !$evBagno:
    block hubTitle:
      ! {icon:Storybook} **Il bagno di Pasqua – Park**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Park [[clicca qui. -> G1BagnoChi]]
  if !$evLambert:
    block hubTitle:
      ! {icon:Storybook} **La torre pericolante – Builder's Office**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Builder's Office [[clicca qui. -> G1Lambert]]
  block hubTitle:
    ! **Evento del terzo Round**
  block hubDetails:
    > Il sindaco Wessel non tossisce più e ha smesso di zoppicare. Ha perso venti chili in un inverno, senza dieta e senza medicine, e la gotta gli è passata in una notte. Al consiglio, adesso, le sedute durano dieci minuti. Nessuno si oppone più a niente.
    if $mugnaio == "partito":
      > Il mulino, senza Harm Visser, macina meglio di prima. Grietje lo manda avanti da sola, e non sbaglia mai il peso di un sacco.
    elif $mugnaio == "rimasto":
      > Al mulino Harm Visser e sua moglie Grietje cantano insieme, mentre lavorano, a due voci. Perfettamente intonati.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    include SetePietra
    ui endOfRound progress="G1R3" next="G1PietraVoto"

::round G1R3 0
fine: La Vecchiaia della Prima Generazione è finita.
poi: Eseguite le azioni di Fine Round, poi continuate con lo Storybook prima della Fine della Generazione.

:: G1Banca
  set evBanca = true
  # **Il professore del museo**
  > Alla Bank, la casa più solida del paese, con l'unica cassaforte della provincia, ti aspetta il professore Ostrander del museo di scienze naturali della città: un signore anziano con gli occhiali d'oro e il collo inamidato. Non è riuscito a comprare la pietra all'asta, dice, e non ne fa una colpa a nessuno. Ma la scienza ha i suoi diritti. Gli basterebbe una scheggia, piccola come un'unghia, per le sue analisi. Ha già preparato il denaro, in una busta.
  ! Che cosa fai?
  [[Gli vendi una scheggia. ~> vendi]]
  [[Rifiuti. ~> rifiuta]]
  fragment vendi:
    set scheggia = true
    set vicini = $vicini + 1
    > La pietra non si lascia scalfire da niente: né dal coltello, né dalla lima, né dal martello. Alla fine ci riesce Jaap Mol, il fabbro, con un colpo solo, preciso. Il professore incassa la scheggia in una scatolina di velluto e riparte con il treno della sera. Qualche mese dopo leggi sul giornale della città che il custode del museo, dopo anni di malattia, è guarito, e che il professore non beve più.
    block setupEvent next=$hub:
      ! Guadagni $3.
  fragment rifiuta:
    > Il professore ripone la busta, deluso ma educato, e ti lascia il suo biglietto da visita, "nel caso cambiaste idea". Tornando alla stazione si ferma all'argine, a guardare la torbiera. Ci resta a lungo. Poi prende il treno.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G1Libri
  set evLibri = true
  # **I libri del pastore**
  > La Church Library è una stanza dietro la sacrestia, con trecento volumi e una stufa che fuma. Il pastore Kalf ti ha lasciato le chiavi e un libro aperto sul leggio: un trattato tedesco di cento anni fa sugli uomini delle paludi. Corpi trovati nella torba, dice il libro, con la pelle e i capelli intatti dopo mille anni, come se dormissero. Alcuni con la corda al collo, altri con le mani legate. Tutti, dice il libro, sepolti vivi. Nessuno sa perché.

  > A margine, nella grafia del pastore: *E se non fossero stati sepolti? Se ci fossero entrati da soli?*
  ! Che cosa fai?
  [[Studi i libri. ~> studia]]
  [[Chiedi al pastore di organizzare una ronda. ~> ronda]]
  fragment studia:
    > Studi per tre sere, al lume della candela. Impari come la torba conserva la carne, come l'acqua scura la concia, come si riconosce un corpo vecchio di secoli da uno di ieri. Impari anche a riconoscere l'odore. Tornando a casa lo senti dappertutto.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 Prova {icon:S3_WeaponToken}.
  fragment ronda:
    set ronda = $ronda + 1
    set fiducia = $fiducia - 1
    set kalf = $kalf + 1
    > Il pastore accetta subito, come se aspettasse solo che qualcuno glielo chiedesse. La prima ronda notturna di {$townname} esce il sabato dopo: il pastore, tre torbai, il becchino Siebe e una lanterna. Non trovano niente. Ma per tutta la notte, dalle case, li guardano passare, dietro i vetri, senza accendere la luce.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G1Sindaco
  set evSindaco = true
  # **Il sindaco guarito**
  > Il sindaco Aldert Wessel ti riceve nel suo ufficio al Town Hall, magro, dritto, roseo, con il colletto troppo largo. Ti offre un bicchiere d'acqua e ti chiede, con grande cortesia, di che cosa hai bisogno. Ricorda il nome di tua madre, il giorno del tuo compleanno, il prezzo esatto che la tenuta ha pagato per il fieno l'anno scorso. Quando gli stringi la mano, è fredda. Il vecchio Wessel aveva le mani sudate, sempre: in paese lo chiamavano "il pesce".
  ! Che cosa fai?
  [[Glielo fai notare, davanti ai consiglieri. ~> pubblico]]
  [[Taci, e lo annoti. ~> annota]]
  [[Gli chiedi della moglie. ~> moglie]]
  fragment pubblico:
    set fiducia = $fiducia - 1
    set wessel = "accusato"
    > Lo dici ad alta voce, ridendo, come una battuta: "Sindaco, vi siete raffreddato?" Nessuno ride. Il sindaco ti guarda con gli occhi chiari, pazienti, e risponde che il dottore della città gli ha prescritto bagni freddi, e che si sente rinato. I consiglieri annuiscono, uno dopo l'altro. Uscendo, ne conti sette con le mani in tasca.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.
  fragment annota:
    set wessel = "annotato"
    > Sorridi, ringrazi, bevi il bicchiere d'acqua fino a metà. A casa, sul tuo quaderno, sotto il nome di Fokke Tammer, scrivi quello del sindaco. La lista è già lunga. Ti accorgi che stai scrivendo i nomi in ordine di gentilezza.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken}.
  fragment moglie:
    set wessel = "moglie"
    > Il sindaco sorride: la signora Wessel sta benissimo, grazie. È partita per la città a primavera, dalla sorella, per un periodo di riposo. Gli scrive ogni settimana. Ti mostra le lettere: una pila ordinata, legata con un nastro. Le buste sono tutte uguali, la calligrafia è tutta uguale, il timbro postale è sempre lo stesso: {$townname}.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e 1 Prova {icon:S3_WeaponToken}.

:: G1Fonderia
  set evFonderia = true
  # **Il conto della fonderia**
  > Alla Foundry, sul canale, il padrone Dirk Haverkamp ti mostra un conto mai pagato, datato 1864 e firmato da tuo padre, che il suo vecchio gli ha lasciato insieme alla fonderia: un anello di ottone del diametro di tre metri, in dodici sezioni; trentasei lastre di vetro nero, fatte venire dalla Boemia; duecento metri di filo di rame. Il conto è alto. Haverkamp tiene ancora i disegni originali, con le misure e le annotazioni del vecchio, e un dodicesimo segmento di ricambio, che il vecchio non è mai venuto a ritirare.
  ! Che cosa fai?
  [[Paghi il conto e ti fai dare i disegni. ~> paga]]
  [[Dici che il conto è di un morto. ~> rifiuta]]
  fragment paga:
    set disegni = true
    > Haverkamp ti consegna un rotolo di disegni legato con lo spago e il segmento di ricambio, avvolto nella tela cerata. Nei disegni, accanto alle misure, il vecchio ha scritto a matita parole che non capisci: *risonanza*, *ritorno*, *ricevitore*, e in fondo al foglio una domanda, cerchiata tre volte: *chi trasmette?*
    block setupEvent next=$hub:
      ! Paga $3. Guadagni 1 {icon:Gears_Icon}, 1 Conoscenza Ingegneristica (Engineering Knowledge) e 1VP.
  fragment rifiuta:
    > Haverkamp non insiste. Dice che terrà i disegni lui, in un cassetto, finché qualcuno della famiglia non verrà a pagare. "Prima o poi verrete", dice, sicuro. "Il vostro vecchio lo diceva sempre: i conti tornano. Anche quelli che non tornano."
    block setupEvent next=$hub:
      ! Guadagni $1.

:: G1Apprendista
  set evApprendista = true
  # **Il ragazzo dei Brink**
  > Al Farmer's Apprentice, il podere dove i ragazzi del paese imparano a mungere e a falciare, la vedova Brink ti aspetta con il grembiule stretto tra le mani. Suo figlio Piet, quindici anni, è caduto nella torbiera a settembre inseguendo un vitello, ed è tornato a casa la mattina dopo, da solo, asciutto. Da allora è il ragazzo più bravo del podere: obbedisce, lavora, impara tutto al primo colpo. Non le ha più risposto male. Non ha più pianto. Ieri sera lei gli ha chiesto se le voleva bene, e lui ha risposto di sì, subito, con un bel sorriso.

  > "Non è lui", dice la vedova. "Lo so che è lui. Ma non è lui."
  ! Che cosa fai?
  [[Le dici che Piet sta bene, e che è cresciuto. ~> cresciuto]]
  [[Porti Piet da Hester Maas. ~> hester]]
  [[Vai con lei alla torbiera, dove è caduto. ~> torbiera]]
  fragment cresciuto:
    set piet = "cresciuto"
    set fiducia = $fiducia + 1
    > La vedova ti guarda come si guarda qualcuno che ha mentito per gentilezza, e ti ringrazia lo stesso. Piet, dietro di lei, sorride. Da quel giorno la vedova non viene più al podere. Piet sì: arriva sempre per primo, e se ne va sempre per ultimo.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Animal_Icon}.
  fragment hester:
    set piet = "visitato"
    set hester = true
    > Hester visita Piet nella cucina dei Brink, con la porta chiusa. Esce dopo un'ora e scrive nel Registro una temperatura e una frase che non ti fa leggere. Poi si siede accanto alla vedova, le prende le mani, e restano così, senza parlare, mentre fuori Piet spacca la legna, colpo dopo colpo, sempre allo stesso ritmo.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1VP.
  fragment torbiera:
    set piet = "torbiera"
    > Al punto dove è caduto Piet, l'acqua è ferma e nera, e sulla superficie galleggiano bolle che non scoppiano. La vedova si inginocchia sulla riva e chiama il figlio per nome, piano, come lo chiamava da bambino. Per un momento, sotto l'acqua, ti sembra di vedere una faccia, bianca, con gli occhi chiusi, girarsi verso la voce. Poi niente.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e 1 {icon:Creepy_Icon}.

// Fine della Generazione: che cosa fare della pietra.
:: G1PietraVoto
  # **La pietra**
  ui specialEvent
  ! **Registro Maas – Hester Maas, *1889.***
  > Il pastore Kalf è venuto alla tenuta, vecchio, con il bastone e il cappello in mano, e ha chiesto di parlare con tutta la famiglia. Ha detto che ha contato anche lui, in questi anni: i matrimoni, i battesimi, le confessioni. Nessuno, a {$townname}, si confessa più. Non hanno peccati.

  > Ha chiesto alla famiglia di riportare la pietra nella torbiera, nel punto esatto della luce, e di lasciarla lì: "Non sappiamo che cosa fa, ma sappiamo che lo fa meglio vicino all'acqua. Allora almeno che lo faccia lontano dalle vostre case." Poi ha aspettato la risposta in piedi, perché la sedia che gli avevano offerto era vicino al camino.
  if $kalf > 0:
    > Prima di andarsene ha benedetto la casa, stanza per stanza, anche la torre chiusa, e ha detto che la famiglia, qualunque cosa decida, è sempre stata dalla parte giusta.
  elif $kalf < 0:
    > Prima di andarsene ha guardato a lungo chi l'aveva contraddetto, anni fa, sul sagrato. Non ha detto niente. Era più triste che arrabbiato.
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: riportate la pietra nella torbiera.
  ! NAY: la pietra resta a **{$pietraNome}**.
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G1PietraEsito" mode="Voting"

:: G1PietraEsito
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[La pietra torna nella torbiera. (YAY) ~> torbiera]]
  [[La pietra resta in famiglia. (NAY) ~> famiglia]]
  fragment torbiera:
    set pietra = "torbiera"
    set pietraChi = ""
    set ronda = $ronda + 1
    > All'alba portate la pietra all'argine, avvolta nel suo sacco, e la consegnate al pastore Kalf, che entra nella torbiera fino alla vita, con la tonaca che galleggia, fino al punto della luce. La lascia andare. La pietra affonda senza un rumore e senza una bolla, come se l'acqua l'aspettasse. Per un momento la superficie, tutta intorno, diventa liscia come vetro. Poi il vento la rompe.

    > Quella notte, a {$townname}, nessuno ha sete.
    block setupEvent next=G1Torre2:
      ! {$pietraNome} rimette il Crown token {icon:S3_CrownToken} sul **Park**: la pietra è nella torbiera.
  fragment famiglia:
    set vicini = $vicini + 1
    > Ringraziate il pastore e gli dite di no: la pietra è un oggetto di studio, e la famiglia della tenuta è una famiglia di scienziati. Il pastore annuisce, rimette il cappello e se ne va per l'argine, piano. Quella sera la pietra resta sulla mensola del laboratorio, calda, nella sua cassetta foderata di feltro. In casa, di notte, tutti si alzano a bere. Nessuno lo dice agli altri.
    block setupEvent next=G1Torre2:
      ! Non succede niente.

// Primo colpo di scena: le due luci erano una cosa sola.
:: G1Torre2
  # **La stanza della torre**
  if $chiave:
    > Il ferro di Jaap Mol, il fabbro, scalda la serratura in un'ora, finché il metallo non diventa rosso e cola come cera. La porta della torre si apre con un lamento di cardini, ventitré anni dopo.
  elif $torre:
    > Lambert, il capomastro, allarga il vecchio buco nel muro finché non ci passa una persona. Non vuole entrare per primo. Nessuno vuole.
  else:
    > Ci vogliono quattro uomini, due leve e un giorno intero per aprire un varco nel muro della torre, di fianco alla porta saldata. Gli operai se ne vanno appena hanno finito, senza aspettare la paga.
  > La scala sale a spirale nel buio, fino alla stanza delle quattro vetrate. Polvere, ragnatele, un odore di rame bruciato. In mezzo alla stanza, su un'impalcatura di legno, c'è un anello di ottone alto due volte un uomo, fatto di dodici sezioni, con il bordo interno rivestito di lastre di vetro nero. È spento. Una delle lastre è spaccata, e nella crepa è rimasta incastrata una scheggia di pietra nera, liscia, identica alla pietra della torbiera.

  > Il pavimento, sotto l'anello, è bruciato in un cerchio perfetto. Sul tavolo, accanto alla finestra che guarda la torbiera, c'è il quaderno del padre, aperto a una pagina segnata con un nastro. Calcoli, distanze, angoli. Poi, in fondo, una riga che non è un delirio:

  > *11 novembre, ore undici e quattordici minuti. Luce sull'anello. Nello stesso istante, luce sulla torbiera, a milleduecento metri, direzione nord-nordest. La Macchina è un ponte: un capo qui, uno là. Qualcosa ha attraversato il ponte dall'altra parte, e io non ho aperto nessun ponte.*

  > **Le due luci erano una cosa sola. La pietra non è caduta dal cielo: l'ha portata nella torbiera la Macchina del padre, una macchina per spostare le cose da un posto all'altro, la notte in cui si è accesa da sola.** I deliri del vecchio erano veri: è passato qualcosa. Resta da capire da dove.
  if $disegni:
    > Sul tavolo, accanto al quaderno, srotolate i disegni comprati alla fonderia. Combaciano con l'anello sezione per sezione. Manca solo un segmento, quello spaccato. Il ricambio, per fortuna, ce l'avete voi.
  ! Che cosa fate del quaderno del padre? *(Decidete insieme.)*
  [[Lo leggete tutto, quella notte stessa. ~> leggi]]
  [[Ne fate una copia per Hester Maas. ~> copia]]
  fragment leggi:
    > Lo leggete a turno, fino all'alba, alla luce di una candela, nella stanza dell'anello. Sono trecento pagine di calcoli, schizzi, prove fallite, bestemmie. Nelle ultime venti, dopo la notte delle due luci, la grafia cambia: diventa piccola, fitta, ossessiva. Il vecchio ha provato a riaccendere la Macchina ogni notte, per quattro mesi, sempre alle undici e un quarto. Non ci è mai riuscito. L'ultima pagina, scritta pochi giorni prima di morire, ha una riga sola: *forse non tocca a me.*
    block setupEvent next=G1TorreFine:
      ! Ogni giocatore guadagna 1 {icon:Insanity_Icon} e 1 Conoscenza Occulta (Occult Knowledge).
  fragment copia:
    set hester = true
    > Ricopiate a mano le pagine più importanti, quelle delle due luci e dei mesi dopo, e le portate a Hester Maas, che le infila nel Registro senza leggerle, tra un certificato di nascita e una ricevuta. "Qualcuno dopo di me le leggerà", dice. "Qualcuno che avrà più tempo di me."
    block setupEvent next=G1TorreFine:
      ! Ogni giocatore guadagna 1VP.

:: G1TorreFine
  if $pietra == "famiglia":
    set macchina = $pietraChi
    set macchinaNome = $pietraNome
    goto G1Macchina
  # **La custodia della Macchina**
  > La pietra è nella torbiera, e nessuno della famiglia l'ha più in mano. La Macchina, però, deve avere qualcuno che la custodisca.
  ! Chi prende in custodia la Macchina? *(Decidete insieme.)*
  set dopo = "G1MacchinaChi"
  [[Clicca per scegliere... => ChiSei]]

:: G1MacchinaChi
  set macchina = $chi
  set macchinaNome = $nomeChi
  goto G1Macchina

:: G1Macchina
  # **La Macchina**
  > La custodia della torre, del quaderno e della Macchina tocca a chi ha avuto in mano la pietra più a lungo, o a chi la famiglia sceglie. Insieme al quaderno c'è un'altra cosa, che il padre ha lasciato sul tavolo, accanto alla penna: il suo orologio da taschino d'argento, quello del panciotto, nuovo, lucido, con lo stemma della tenuta. Fermo sulle undici e un quarto. Lo carichi, e riparte.

  > Da quel giorno chi ha la Macchina lo porta sempre con sé. Nessuno, in famiglia, ci trova niente di strano. Solo Hester Maas, quando lo vede, impallidisce, e va a casa a controllare il cassetto del Registro.
  set _SetupImage = "S3_ScenarioIcon"
  ! **{$macchinaNome}** prende il Masterwork **Teleportation** messo da parte e lo mette al posto del suo Masterwork, che torna nella scatola: riparare la Macchina è completare questo Masterwork. Prende anche la Compulsion **"They'll never understand…"** messa da parte.
  ! *La Macchina e l'orologio del padre restano a {$macchinaNome}, e poi ai suoi eredi, per tutta la partita.*
  [[Clicca per continuare... => G1Chiusura]]

:: G1Chiusura
  # **Fine della Generazione**
  ! **Registro Maas – Hester Maas, *1890.***
  > Sono vecchia, e la mano non mi aiuta più. Questa è l'ultima pagina che scrivo. Lascio il Registro a mio figlio Joost, che si è laureato in medicina in città e torna a {$townname} come medico condotto. Lui ride delle mie mani fredde. Ha studiato, e chi ha studiato non conta: misura.

  > Gli eredi della tenuta sono invecchiati, come me. Alcuni sono morti, nel loro letto, di vecchiaia, con le mani calde: li ho toccate io. La Macchina è rimasta nella torre, muta. I loro figli sono cresciuti a {$townname}, e non sanno che cosa fosse {$townname} prima.
  if $pietra == "torbiera":
    > La pietra è tornata nella torbiera. Quest'inverno il punto della luce non è gelato, nemmeno nelle notti più fredde.
  else:
    > La pietra è ancora alla tenuta, sulla mensola del laboratorio. La famiglia beve molta acqua. La compra in città.
  > I nomi nel Registro, quelli con le mani fredde, sono centoquattordici. In paese gli abitanti sono trecentoventi. Non lo dico a nessuno: tanto, a chi lo direi?
  include FineVicini
  ui endOfGeneration generation=3 text: Rimuovete tutti i pezzi dal tabellone ed eseguite la Fine della Generazione. Rimettete nella riserva i token {icon:StorybookToken} non usati. I Vicini {icon:S3_WoodenFigureToken} e i token {icon:S3_ParadoxToken} rimasti sul tabellone tornano nella riserva; chi ha bevuto tiene davanti a sé i suoi token {icon:S3_ParadoxToken}.
  [[Clicca per continuare... => VSG2Intro]]

// Arricchimento: un evento in più per la Maturità e per la Vecchiaia, una lettera dopo l'asta.

:: G1Ostrander
  # **Una lettera dalla città**
  ! **Lettera del professor Ostrander al direttore del museo di scienze naturali – *giugno 1866.***
  > Illustre collega, vi scrivo da {$townname}, un paese di torbai a mezza giornata di treno, dove sono venuto per l'oggetto di cui vi parlai: il cosiddetto "sasso della luce". Torno a mani vuote. L'oggetto è stato aggiudicato a un membro della famiglia della tenuta, {$pietraNome}, per una cifra che il museo non avrebbe mai approvato. Ve ne dò comunque una descrizione, perché resti agli atti.

  > Pietra nera, liscia, grande come una pagnotta, di peso specifico anomalo. Temperatura costante, superiore a quella dell'ambiente: la si sente calda attraverso il sacco. Nessuna cristallizzazione visibile, nessuna frattura. Non è un meteorite di nessun tipo che io conosca. Il torbaio che l'ha trovata, un certo Tammer, la maneggiava come una cosa viva.

  > Aggiungo un'impressione personale, di cui non andate a parlare in consiglio. {$townname} è il paese più tranquillo che io abbia mai visitato. Nessuno, all'asta, ha alzato la voce. Nessuno ha contrattato. Quando il banditore ha battuto il martello, la folla ha applaudito tutta insieme, e ha smesso tutta insieme. All'osteria mi hanno servito acqua, anche se avevo chiesto birra, e l'oste mi ha detto, con un sorriso, che "è meglio per tutti".

  > Ho lasciato il mio biglietto da visita alla famiglia. Conto di tornare. Il vostro devotissimo, J. Ostrander.
  [[Continua... => G1R2]]

:: G1Mugnaio
  set evMugnaio = true
  # **La moglie del mugnaio**
  > Alla Traveling Caravan, davanti al carro che vende i biglietti per la diligenza della città, c'è Harm Visser, il mugnaio, con un fagotto in mano e la faccia di chi non dorme da settimane. Vuole partire, dice, ma non trova il coraggio di comprare il biglietto. Sua moglie Grietje, dall'inverno, non è più lei. Canta mentre lavora, e prima stonava. Non litiga più con la suocera, e prima la odiava. Lo bacia sulla fronte ogni sera, e non lo aveva mai fatto, nemmeno da sposi. È perfetta. Lui ha paura di lei come non ha mai avuto paura di niente.

  > "Ditemi che sono pazzo", ti chiede. "Voi della tenuta avete studiato. Ditemelo, e torno a casa."
  ! Che cosa fai?
  [[Gli dici che è stanco, e che deve tornare a casa. ~> resta]]
  [[Gli paghi il biglietto ($2). ~> parte]]
  [[Gli chiedi dove era sua moglie, la notte prima che cambiasse. ~> notte]]
  fragment resta:
    set mugnaio = "rimasto"
    set fiducia = $fiducia + 1
    > Harm ti ringrazia, sollevato, come un malato a cui il medico dice che non è niente. Torna a casa con il fagotto sotto il braccio. Il mese dopo lo incroci al mercato: la camicia stirata, le mani pulite, un sorriso tranquillo. Ti saluta con un cenno, gentile. Non ti ringrazia più.
    block setupEvent next=$hub:
      ! Guadagni $1 e 1VP.
  fragment parte:
    set mugnaio = "partito"
    set ronda = $ronda + 1
    > Gli compri il biglietto e lo accompagni alla diligenza. Harm si siede in fondo, stringendo il fagotto, e non si volta indietro. Grietje non viene a salutarlo. Viene il giorno dopo alla tenuta, invece, con una torta, a ringraziare la famiglia "per aver aiutato il povero Harm, che non stava bene". La torta è perfetta.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 1 Prova {icon:S3_WeaponToken} e 1VP.
  fragment notte:
    set mugnaio = "notte"
    > Harm ci pensa. La notte di San Nicola, dice, Grietje è uscita a prendere l'acqua al canale, perché quella del pozzo era gelata. È tornata dopo un'ora, asciutta, senza il secchio. Ha detto che il canale era bellissimo, di notte, e che non aveva freddo. Poi si è messa a letto e ha dormito senza un sospiro. Lui, quella notte, ha pianto senza sapere perché.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Insanity_Icon}.

:: G1Lambert
  set evLambert = true
  # **La torre pericolante**
  > Al Builder's Office il capomastro Lambert ha srotolato sul tavolo una delibera del consiglio, firmata e timbrata: la torre della tenuta è "pericolante", e va abbattuta entro l'anno, a spese del comune, per la sicurezza dei cittadini. Lambert la legge ad alta voce, con la sua voce tranquilla. Le bende sulle mani non le porta più da anni. Si offre di occuparsene di persona, con i suoi uomini, gratis. "Così non ci pensate più", dice. "Così nessuno ci pensa più."
  ! Che cosa fai?
  [[Rifiuti, e minacci di andare in tribunale. ~> rifiuta]]
  [[Gli chiedi di rinforzarla, invece, a tue spese ($2). ~> rinforza]]
  [[Gli chiedi chi ha proposto la delibera. ~> chi]]
  fragment rifiuta:
    set fiducia = $fiducia - 1
    > Lambert non insiste. Riarrotola la delibera con cura, la lega con lo spago e la ripone nel cassetto. Il consiglio non ne parlerà più. Ma la sera, dalla finestra della tenuta, vedi Lambert in piedi sulla strada, a guardare la torre per un'ora, immobile, come si guarda un vecchio nemico o un vecchio amico.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1VP.
  fragment rinforza:
    set lambert = true
    > Lambert accetta, con la stessa calma. I suoi uomini lavorano un mese: catene di ferro intorno ai muri, una scala nuova, travi di quercia. Lavorano bene, meglio di quanto chiunque abbia mai lavorato a {$townname}. Non salgono mai oltre la scala, però. Della stanza in cima, dicono, non si occupano.
    block setupEvent next=$hub:
      ! Paga $2. Guadagni 1 Conoscenza Ingegneristica (Engineering Knowledge) e 1 {icon:Gears_Icon}.
  fragment chi:
    > Lambert ti mostra la prima pagina della delibera. La proposta è firmata da tre consiglieri: il sindaco Wessel, il segretario, e un consigliere nuovo, eletto quest'anno con tutti i voti del paese. Il consigliere nuovo si chiama Fokke Tammer. Vent'anni fa non sapeva scrivere il suo nome. La firma è elegante, regolare, inclinata come quella di un notaio.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.

:: G1Wessel
  set evWessel1 = true
  # **Il sindaco con la gotta**
  > Al Town Hall il sindaco Aldert Wessel ti riceve con il piede fasciato su uno sgabello e un fazzoletto in mano, con cui si asciuga la fronte ogni due minuti. È un uomo grosso, rosso, sudato, che parla troppo e ride delle sue battute. In paese lo chiamano "il pesce" per le mani sempre umide, e lui lo sa, e ne ride. Ha una proposta: il comune comprerebbe la torre della tenuta, "per farne un serbatoio d'acqua", e pagherebbe bene. Tuo padre, dice, gli doveva dei soldi. Tanti. E poi quella torre, di notte, con i lampi azzurri, spaventava sua moglie.
  ! Che cosa fai?
  [[Paghi il debito del padre ($2). ~> paga]]
  [[Gli dici che la torre non è in vendita. ~> rifiuta]]
  [[Gli chiedi della notte delle due luci. ~> luci]]
  fragment paga:
    set fiducia = $fiducia + 1
    > Il sindaco conta il denaro due volte, con le dita sudate, e ti firma la ricevuta con uno svolazzo. Poi ti offre un sigaro e ti racconta, ridendo, tre barzellette sporche sul pastore Kalf. Sono pessime. Esci dal Town Hall con il mal di testa e una strana tenerezza per quell'uomo rumoroso.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 2VP.
  fragment rifiuta:
    > Il sindaco si offende, diventa più rosso, alza la voce. Dice che la tenuta non è sopra la legge, e che il consiglio ha i suoi mezzi. Poi, come sempre, si calma, si asciuga la fronte e ti chiede scusa: è la gotta, dice, che lo rende nervoso. Ti accompagna alla porta zoppicando e ti stringe la mano. È umida e calda.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Creepy_Icon}.
  fragment luci:
    > Il sindaco smette di ridere. Quella notte, dice, era sveglio per il dolore al piede, e dalla finestra ha visto tutto: la luce sulla torre e quella sulla torbiera, nello stesso istante, come due lanterne che si fanno segnali. Ha avuto paura. Non lo ha detto a nessuno, perché un sindaco non ha paura. "Ma voi siete la famiglia", dice. "Voi dovete sapere che cosa avete in casa."
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 Conoscenza Occulta (Occult Knowledge).

:: G1BagnoChi
  set dopo = "G1Bagno"
  goto ChiSei

:: G1Bagno
  set evBagno = true
  # **Il bagno di Pasqua**
  > Al Park, la mattina di Pasqua, c'è una folla in camicia bianca sulla riva dello stagno. È una tradizione nuova, nata da due anni senza che nessuno l'abbia decisa: chi vuole cominciare l'anno "pulito" entra nell'acqua, che lì arriva dritta dalla torbiera, fino alla vita, e ne esce in silenzio. Il pastore Kalf non c'è: ha detto che è un rito pagano. Il sindaco Wessel sì, in prima fila, e tiene per mano chi ha paura. Qualcuno ti tende la mano. Sorride.
  ! Che cosa fai?
  [[Entri nell'acqua con loro. ~> entra]]
  [[Resti sulla riva, a contare chi esce. ~> conta]]
  fragment entra:
    set vicini = $vicini + 1
    set fiducia = $fiducia + 1
::for L in A B C D
    if $chi == "%L%":
      set acqua%L% = $acqua%L% + 1
::endfor
    > L'acqua è gelida, poi non più. Resti lì, con l'acqua fino alla vita e la mano di uno sconosciuto nella tua, e per un lungo momento nessuno respira. Quando esci, la gente ti abbraccia, uno dopo l'altro. Torni a casa con il cuore leggero, senza pensieri. Nemmeno uno.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 Conoscenza Biologica (Biology Knowledge).
  fragment conta:
    > Resti sulla riva con il taccuino. Entrano in quarantadue. Ne escono quarantadue. Ma tre di loro, entrando, tossivano, e uscendo non tossiscono più; uno zoppicava, e ora cammina dritto; una ragazza piangeva, e ora sorride. Annoti i nomi. Quando alzi gli occhi, quelli usciti dall'acqua ti stanno guardando, in fila, gentili.
    block setupEvent next=$hub:
      ! Guadagni 2 Prove {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.

