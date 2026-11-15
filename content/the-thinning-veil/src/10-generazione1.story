// Prima Generazione – "Colpi nel buio" (1848–1856).

// Pagina narrata (tag voice): niente nomi né varianti nel testo narrativo.
:: G1Intro [INTRO voice]
  # **GENERAZIONE I: Colpi nel buio**
  ! **Verbale della veglia funebre – {$townname}, *2 novembre 1848.***
  > Il padre fu sepolto il giorno dei morti, sotto una pioggia sottile che non si decideva a cadere. Il villaggio venne al cimitero in buon numero, ma restò al di là del muretto: nessuno volle avvicinarsi alla fossa, e il becchino lavorò in fretta, senza guardare dentro. Si raccontava che il vecchio avesse passato gli ultimi anni chiuso nella tenuta con macchine che ronzavano di notte, e che dalle finestre del suo laboratorio uscisse, a volte, una luce di un colore che nessuno sapeva nominare.

  > Gli eredi erano arrivati con la diligenza della sera prima, ognuno da una città diversa, ognuno con un baule e la stessa lettera del notaio. La tenuta era loro, e con essa i debiti, gli strumenti, gli animali nelle gabbie e il Journal del padre: un quaderno rilegato in pelle, gonfio di appunti, schizzi e formule. Sull'ultima pagina scritta c'era una sola frase, sottolineata due volte con tanta forza da incidere la carta:

  > *"La morte non è una porta chiusa: è un velo. E i veli si sollevano."*

  > Padre Anzelm benedisse la salma, chiuse il libro delle preghiere e disse agli eredi, a voce abbastanza alta perché lo sentissero tutti, che avrebbe pregato per la loro anima con particolare impegno.

  > Quella notte, nella tenuta, qualcosa cominciò a bussare alle pareti.
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G1ColpiA:
      include AzzeraTraguardi
      include PosaTraguardi

// I colpi: ogni erede, da solo, decide come rispondere.
::for L in A B C D | Fine
:: G1Colpi%L%
  if %L.n% > $players:
    goto G1ColpiFine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **I colpi**
  ! **Diario di {$name%L%} – *notte del 2 novembre 1848.***
  > Non riesco a dormire. La camera che mi hanno dato era quella di nostro padre: il letto ha ancora la forma del suo corpo, e l'aria sa di canfora e di acido. Ho spento la candela da un'ora quando sento il primo colpo.

  > Viene dalla parete dietro la testiera. Un colpo secco, come di nocca sul legno. Poi due. Poi uno. Poi niente, così a lungo che quasi mi convinco di averlo sognato; e allora ricominciano, sempre uguali, pazienti, come chi bussa a una porta sapendo che in casa c'è qualcuno.

  > Nella sua biblioteca ho visto un libretto francese sui tavolini parlanti: un colpo per dire sì, due per dire no. Mi torna in mente adesso, nel buio, e vorrei che non mi fosse tornato in mente.

  ! Che cosa fai?
  [[Rispondi ai colpi. ~> risposta]]
  [[Mandi a chiamare Padre Anzelm. ~> prete]]
  [[Ti copri la testa con il cuscino. ~> niente]]
  fragment risposta:
    set colpi%L% = "risposto"
    set velo = $velo + 1
    > Mi siedo sul letto e busso una volta sola, con la nocca, sulla parete fredda.

    > Dall'altra parte, una volta.

    > Chiedo, a voce bassissima, se è lui. Un colpo. Chiedo se è in pace. Due colpi, così forti che la brocca trema sul comò. Poi silenzio, e un odore di cera, anche se nella stanza non c'è nessuna candela accesa. Al mattino ho le dita intorpidite e il Journal aperto sul cuscino, a una pagina che non ricordo di aver mai letto.
    block setupEvent next=G1Colpi%L.next%:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment prete:
    set colpi%L% = "prete"
    set fede = $fede - 1
    > Sveglio il servitore e lo mando in paese con la lanterna. Padre Anzelm arriva un'ora dopo, con la stola sopra la camicia da notte e l'acqua santa in una bottiglia da farmacia. Benedice la parete, il letto, la finestra e, per scrupolo, anche me.

    > I colpi tacciono subito. Il prete, però, resta sulla soglia più del necessario, a guardarsi intorno: le gabbie, gli alambicchi, il Journal aperto sul tavolo. Prima di andarsene mi stringe la mano e mi lascia qualche moneta "per le spese di casa, finché non sarà tutto in ordine". Mi sembra più un acconto che una carità.
    block setupEvent next=G1Colpi%L.next%:
      ! Guadagni $2.
  fragment niente:
    set colpi%L% = "ignorato"
    > Mi infilo sotto le coperte e premo il cuscino sulle orecchie, come da bambini durante i temporali. I colpi continuano a lungo, attutiti, e a un certo punto mi sembra che si spostino: dalla parete al pavimento, dal pavimento alla testiera, a un palmo dal mio orecchio. Poi, finalmente, smettono.

    > All'alba scosto la tenda. Sulla parete, all'altezza della mia testa, l'intonaco è scrostato in un cerchio piccolo e regolare, come consumato da una nocca che abbia bussato per anni.
    block setupEvent next=G1Colpi%L.next%:
      ! Non succede niente. Per ora.
::endfor

:: G1ColpiFine
  # **Il mattino dopo**
  > A colazione nessuno parla dei colpi. Il caffè è troppo forte, il pane è di ieri e tutti hanno gli occhi cerchiati. Qualcuno fa una battuta sui topi della soffitta, e nessuno ride.

  > Dalla finestra della sala da pranzo si vede il villaggio: poche case di legno strette intorno alla chiesa, il fumo dei camini, il mercato che si sveglia. È un posto povero e sospettoso. Ma il padre ha lasciato agli eredi una tenuta, un laboratorio e un nome che fa ancora abbassare la voce alla gente; e un nome, per chi sa usarlo, vale quanto un capitale.
  ! Che cosa proponi, a colazione?
  [[Di chiamare il parroco a benedire la casa. ~> prete]]
  [[Di studiare i colpi con metodo, come avrebbe fatto il padre. ~> metodo]]
  [[Niente: cambi discorso e parli del tempo. ~> niente]]
  fragment prete:
    set fede = $fede - 1
    set velo = $velo - 1
    > La proposta cade nel silenzio come un cucchiaio sul pavimento. Poi qualcuno annuisce, e qualcun altro alza le spalle. Padre Anzelm viene il pomeriggio stesso, benedice ogni stanza, perfino le gabbie del laboratorio, e se ne va con l'aria di chi ha messo una toppa su un vestito che non durerà.
    [[Continua... => G1R1]]
  fragment metodo:
    set velo = $velo + 1
    > La proposta piace più di quanto ti aspettassi: in fondo siete scienziati, o figli di uno scienziato. In un pomeriggio la camera del padre diventa un osservatorio: un orologio a pendolo, un quaderno con le colonne per l'ora, il numero dei colpi e la parete, un filo di seta teso da un muro all'altro con tre campanelli. Quella notte i campanelli suonano tutti e tre, nell'ordine giusto.
    [[Continua... => G1R1]]
  fragment niente:
    > Parli del tempo, delle strade, del prezzo della legna. Gli altri ti seguono con sollievo. È una conversazione lunga, educata, completamente inutile; e alla fine della colazione tutti sanno, senza bisogno di dirlo, che stanotte nessuno spegnerà la candela.
    [[Continua... => G1R1]]

:: G1R1 [HUB]
  # **IL VELO SOTTILE – Giovinezza**
  set round = 1
  if $hub != "G1R1":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Aprite la Village Chronicle alla sezione **The Cost of Disease** ({icon:S1_ScenarioIcon}) e andate a **pagina 1**.
      include PreparaFolla
  set hub = "G1R1"
  include Traguardi
  if !$evTubo:
    block hubTitle:
      ! {icon:Storybook} **Il tubo nella tomba – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G1Tubo]]
  if !$evFabbro:
    block hubTitle:
      ! {icon:Storybook} **Il gioco del bambino – Blacksmith**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Blacksmith [[clicca qui. -> G1Fabbro]]
  if !$evCarro:
    block hubTitle:
      ! {icon:Storybook} **Il carro vuoto – Traveling Caravan**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Traveling Caravan [[clicca qui. -> G1Carro]]
  if !$evCodicillo:
    block hubTitle:
      ! {icon:Storybook} **Il codicillo – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G1Codicillo]]
  if !$evDagherrotipo:
    block hubTitle:
      ! {icon:Storybook} **Il dagherrotipo – Farmer's Market**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Farmer's Market [[clicca qui. -> G1Dagherrotipo]]
  block hubTitle:
    ! **Evento del primo Round**
  block hubDetails:
    > Una carovana si è fermata ai margini del villaggio. Si dice che a bordo viaggi una donna che parla con i morti, e che i morti le rispondano.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G1R1" next="G1Seduta"

::round G1R1 1
fine: La Giovinezza della Prima Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Maturità prima di continuare.

:: G1Tubo
  set evTubo = true
  # **Il tubo nella tomba**
  > La terra sulla tomba del padre è ancora fresca, e dal centro del tumulo spunta un tubo d'ottone grosso come un polso, chiuso da un coperchio a vite e sormontato da un campanello. Il becchino, un uomo grande e taciturno di nome Mihály, si toglie il berretto prima di spiegare.

  > "Istruzioni del defunto", dice. "Scritte di suo pugno e pagate al notaio in anticipo. Il tubo scende fino alla bara, all'altezza della bocca. Se il signore si sveglia, può chiamare; se non ha fiato per chiamare, c'è la cordicella del campanello, legata al suo polso. Quaranta giorni deve restare aperto. Poi si può chiudere." Si rimette il berretto. "Ne ho sepolti tanti, di signori che avevano paura di essere sepolti vivi. Questo è il primo che sembrava avere paura del contrario."
  ! Che cosa fai?
  [[Torni di notte e appoggi l'orecchio al tubo. ~> ascolta]]
  [[Fai sigillare il tubo con il piombo. ~> sigilla]]
  [[Lasci tutto com'è, per quaranta giorni. ~> lascia]]
  fragment ascolta:
    set tubo = "ascoltato"
    set velo = $velo + 1
    > Il cimitero di notte è più piccolo che di giorno: le tombe si stringono, il muretto si avvicina. Sviti il coperchio e ti inginocchi nel fango. Dal tubo sale un'aria fredda, che sa di cera e di terra. All'inizio non senti niente; poi, molto in fondo, tre colpi lievissimi, come di un'unghia sul legno. Uno. Due. Uno.

    > Poi una voce, così bassa che potrebbe essere il vento nell'ottone, pronuncia una parola sola, che non capisci. Riavviti il coperchio con le mani che tremano. Sul campanello, quando ti alzi, c'è una goccia di rugiada che non cade.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment sigilla:
    set tubo = "sigillato"
    set velo = $velo - 1
    set fede = $fede - 1
    > Il fabbro cola il piombo nel tubo davanti a te e a Padre Anzelm, che ha voluto esserci e benedice la colata come si benedice una campana. Il metallo fuso scende gorgogliando, poi si ferma, e per un attimo dal tubo esce un sibilo lungo, come di qualcuno che trattiene il fiato. Il fabbro dice che è l'aria. Il prete non dice niente.

    > Il campanello lo togli tu, e lo porti a casa avvolto in un fazzoletto. Lo metti in un cassetto dello scrittoio. Per tutto l'inverno, nel cassetto, non suona mai; e tu, per tutto l'inverno, apri il cassetto ogni sera per controllare.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment lascia:
    set tubo = "lasciato"
    > Lasci il tubo aperto, come voleva il padre, e dai a Mihály una moneta perché passi a controllare il campanello ogni mattina. Per trentanove giorni il becchino viene alla tenuta, si toglie il berretto e dice: "Niente".

    > Il quarantesimo giorno non viene. Lo trovi al cimitero, seduto sulla tomba, pallido. Il campanello è fermo, dice; non ha suonato. Ma stanotte, per la prima volta, qualcuno ha svitato il coperchio dall'interno. Poi, per ringraziarti della pazienza, ti offre sottovoce un favore del mestiere: qualcosa dalla fossa comune, che nessuno verrà a reclamare.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Bodies_Icon}.

:: G1Fabbro
  set evFabbro = true
  # **Il gioco del bambino**
  > Nella bottega del fabbro, mentre aspetti che ti ferri il cavallo, senti un ritmo che conosci. Viene da dietro la forgia: un colpo, due, uno. Poi una pausa. Poi di nuovo: uno, due, uno. Dietro la forgia c'è un bambino di sei o sette anni, con i capelli bruciacchiati e un martelletto in mano, che batte con pazienza contro il fianco dell'incudine.

  > Si chiama Jóska, ed è il figlio del fabbro. Ti spiega, serissimo, che di notte dal suo letto sente bussare dall'altra parte del fiume, dalla casa grande, e che lui risponde, così chi bussa non si sente solo. Il padre lo afferra per un orecchio e si scusa: il bambino ha troppa fantasia, e la casa grande, con rispetto parlando, fa troppo rumore.
  ! Che cosa fai?
  [[Gli regali una moneta e gli chiedi di insegnarti il gioco. ~> amico]]
  [[Dici al padre di farlo smettere. ~> offeso]]
  fragment amico:
    set joska = "amico"
    > Jóska ti insegna il gioco con l'aria importante di un maestro. Un colpo è sì, due è no, ma questo lo sanno tutti; il bello, dice, è che se aspetti abbastanza i colpi diventano lettere, e le lettere parole. Ti mostra le sue: una fila di tacche sul legno della porta, che ha contato notte dopo notte.

    > Quando te ne vai ti chiede se tornerai. Gli dici di sì. Il padre, intenerito, ti riempie le tasche di ritagli di metallo che non gli servono più.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Gears_Icon}.
  fragment offeso:
    set joska = "offeso"
    > Il fabbro toglie il martelletto al figlio e lo manda in casa con uno scappellotto. Il bambino non piange. Si ferma sulla soglia e ti guarda a lungo, con gli occhi asciutti, come si guarda qualcuno che si vuole ricordare.

    > Il fabbro, mortificato, non vuole essere pagato per il cavallo. Quella notte, alla tenuta, i colpi alle pareti sono più forti e più rapidi del solito, come quelli di chi bussa e non riceve risposta.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G1Carro
  set evCarro = true
  # **Il carro vuoto**
  > Madame Vámos è in paese, a consolare una vedova. Il suo carro è fermo al margine del bosco, con i cavalli che brucano e la porta socchiusa, come se qualcuno l'avesse lasciata aperta apposta. Dentro c'è buio, e un odore di incenso, di cavallo e di qualcosa di più dolce, come di fiori lasciati troppo a lungo nell'acqua.

  > Ci sono un tavolino rotondo coperto da un drappo di velluto, quattro sedie, un ritratto voltato contro la parete e, sotto la cuccetta, un baule con gli angoli di ferro. Nessuno ti vede. Hai il tempo di guardare una cosa, forse due.
  ! Che cosa fai?
  [[Guardi sotto il tavolino. ~> tavolo]]
  [[Apri il baule. ~> baule]]
  [[Te ne vai senza toccare niente. ~> via]]
  fragment tavolo:
    set trucchi = $trucchi + 1
    > Sotto il drappo il tavolino ha una gamba sola, cava, con una leva di legno che sporge appena dal pavimento: un pedale, all'altezza del piede di chi siede al posto della medium. E dal piano scende un filo di seta nera, sottilissimo, che sparisce in un buco nell'assito.

    > È un trucco, ed è un trucco ben fatto. Lo stai ancora ammirando quando il tavolino, senza che nessuno abbia toccato il pedale, batte un colpo solo contro il pavimento. Esci dal carro in gran fretta. Però il meccanismo, a casa, lo disegni a memoria.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Ingegneristica (Engineering Knowledge).
  fragment baule:
    set lettere = true
    set velo = $velo + 1
    > Il baule non è chiuso a chiave. Dentro ci sono scialli, mazzi di carte, una boccetta di fosforo e un pacco di lettere legate con un nastro nero. La calligrafia la riconosci subito: è quella del Journal. Sono lettere di tuo padre, indirizzate a *"Eszter"*, e le date vanno dal 1821 a pochi mesi fa.

    > Ne leggi una sola, la prima che ti capita: parla di un esperimento, di una porta, di una promessa che "ci rivedremo, in un modo o nell'altro". È datata tre settimane dopo il funerale. Rimetti tutto a posto, con il nastro annodato com'era, e per giorni non riesci a togliertela dalla testa.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment via:
    > Chiudi la porta del carro e ti allontani. Sul sentiero incroci Madame Vámos, che torna dal paese con il cestino al braccio. Ti guarda la mano, quella con cui hai chiuso la porta, e sorride.

    > "Siete una persona educata", dice. "Vostro padre, alla vostra età, non lo era." Poi ti mette nel palmo una moneta d'argento molto vecchia, con un'effigie che non riconosci, "per quando vorrete tornare". Non sai se sia un complimento o un acconto.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G1Codicillo
  set evCodicillo = true
  # **Il codicillo**
  > Nell'ufficio del notaio, al primo piano del Town Hall, c'è odore di carta umida e di tabacco. Il notaio è un uomo minuto, con la parrucca un po' storta, e ha l'aria di chi deve leggere qualcosa che avrebbe preferito non trovare. Si tratta di un codicillo al testamento del padre, scritto di suo pugno, arrivato per posta da Vienna una settimana dopo il funerale.

  > *"La mia camera resti com'è: il letto, le carte, la lampada, la sedia accanto al letto. Non si sposti nulla e non si apra la finestra finché qualcuno, in quella stanza, continuerà a bussare. Dopo, fatene quello che volete."* Il notaio solleva gli occhi dal foglio. "La legge non vi obbliga", dice. "Ma io, al vostro posto, ci penserei."
  ! Che cosa fai?
  [[Rispetti il codicillo: la camera resta com'è. ~> intatta]]
  [[Fai svuotare la camera e la trasformi in laboratorio. ~> svuotata]]
  fragment intatta:
    set camera = "intatta"
    set velo = $velo + 1
    > La camera resta com'era: il letto con la forma del corpo, la lampada spenta, la sedia accanto al letto, sempre un poco scostata, come se qualcuno ci si fosse appena seduto. La governante si rifiuta di spolverarla. Tu ci entri ogni tanto, la sera, e ogni volta la sedia è più vicina al letto.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Insanity_Icon}.
  fragment svuotata:
    set camera = "svuotata"
    set velo = $velo - 1
    > Fai portare via tutto in un pomeriggio: il letto in soffitta, le carte nello studio, la sedia in cucina. Quando sollevano il materasso, sotto ci sono decine di fogli piegati, fitti di appunti, con le date delle ultime notti del padre. In fondo all'ultimo, una riga più grande delle altre: *"Rispondono."*

    > Quella notte, nella camera vuota, nessuno bussa. Bussano in cucina, contro la sedia.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge).

:: G1Dagherrotipo
  set evDagherrotipo = true
  # **Il dagherrotipo**
  > Al Farmer's Market, tra le ceste di cavoli, un fotografo ambulante ha montato un banco con un drappo nero e una cassetta di lastre d'argento. Si chiama Koch, viene da Pest, e fa ritratti ai vivi e ai morti: i morti costano di più, dice, perché stanno fermi meglio, ma bisogna tenerli seduti con un'asta di ferro dietro la schiena.

  > Quando sente il tuo cognome si illumina. Tre mesi prima del funerale, dice, ha fatto un ritratto a tuo padre, nella tenuta, e non è mai stato pagato. Ti mostra la lastra: il padre seduto, magro, con il Journal sulle ginocchia e una sedia vuota accanto. E nell'argento lucido, se la inclini contro la luce, sulla sedia vuota c'è una donna con uno scialle nero.
  ! Che cosa fai?
  [[Compri il ritratto. ~> compra]]
  [[Chiedi al fotografo chi fosse la donna. ~> chiedi]]
  [[Gli chiedi di distruggere la lastra, e lo paghi per questo. ~> distruggi]]
  fragment compra:
    set velo = $velo + 1
    > Paghi il debito di tuo padre, con gli interessi, e porti a casa il ritratto avvolto in un panno. Lo appendi nello studio. Di giorno la sedia accanto al padre è vuota. Di sera, con la lampada accesa, non sempre.
    block setupEvent next=$hub:
      ! Guadagni 2VP e 1 {icon:Insanity_Icon}.
  fragment chiedi:
    > Il fotografo si gratta la testa. Nella stanza non c'era nessuna donna, dice: c'erano lui, il signore e la sedia vuota, che il signore aveva voluto a tutti i costi accanto a sé, "per un'amica che arriverà". La posa durò due minuti. A metà, il signore sorrise. Per questo, nel ritratto, ha la bocca un po' mossa.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge).
  fragment distruggi:
    set velo = $velo - 1
    > Il fotografo esita, poi strofina la lastra con uno straccio imbevuto di cianuro, davanti a te. L'argento si annebbia, il padre scompare, la sedia scompare. Per ultima scompare la donna, e ti sembra, ma è certamente un effetto della luce, che faccia in tempo a voltarsi verso di te.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G1Seduta
  # **La prima seduta**
  include CasoGiocatore
  ! **Diario di {$caso} – *dicembre 1848.***
  > Il carro di Madame Vámos è dipinto di blu notte e coperto di stelle d'oro scrostate. Ha ruote alte, tende di velluto e, sulla porta, una mano aperta con un occhio nel palmo. È fermo ai margini del villaggio da tre settimane, e in tre settimane metà delle vedove di {$townname} ci sono salite almeno una volta, di nascosto dal parroco.

  > Stamattina la medium si è presentata alla tenuta in persona. È una donna piccola, di età indefinibile, avvolta in uno scialle nero; parla piano, con un accento che non riesco a collocare, e ha mani molto bianche e molto fredde. Ha detto di aver sentito i colpi. Non che qualcuno le ha raccontato dei colpi: che li ha *sentiti*, dalla strada, passando davanti al cancello nella notte dei morti.

  > "Vostro padre ha qualcosa da dire", ci ha detto. "E non parla volentieri a chi non lo ascolta." Poi ha invitato tutti noi a una seduta nel suo carro, domani a mezzanotte. Non ha chiesto denaro. Questo, più di tutto il resto, mi preoccupa.
  [[Clicca per continuare... => G1SedutaVoto]]

:: G1SedutaVoto
  # **Partecipare?**
  ui specialEvent
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: partecipi alla seduta di Madame Vámos.
  ! NAY: resti alla tenuta.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G1SedutaEsito" mode="Voting"

:: G1SedutaEsito
  # **Chi è andato?**
  prompt partecipanti number: Quanti giocatori hanno votato YAY?
  goto G1SedutaRacconto

:: G1SedutaRacconto
  # **Il tavolino**
  set velo = $velo + $partecipanti
  if $partecipanti == 0:
    set velo = $velo + 1
    > Nessuno va. Madame Vámos accende le candele, siede al tavolino e aspetta fino all'alba davanti a sedie vuote. Il garzone del fornaio, che passa di lì alle quattro, giura di averla sentita parlare con qualcuno, e di aver sentito qualcuno rispondere.

    > Quella notte, alla tenuta, i colpi raddoppiano. Bussano a tutte le pareti, a tutte le porte, alla testiera di ogni letto. Bussano come chi è stato lasciato fuori al freddo.
  elif $partecipanti >= $players:
    > Tutti gli eredi siedono intorno al tavolino rotondo, nel carro che sa di incenso e di cavallo. Madame chiede di unire le mani; le sue dita sono gelide. Recita qualcosa in una lingua che nessuno riconosce, poi tace, e nel silenzio il tavolino scricchiola, si inclina e si solleva da terra di un palmo, con tutte le mani sopra.

    > Resta sospeso per il tempo di un respiro. Poi ricade con un colpo solo, secco. Madame apre gli occhi e sorride come chi ha appena ricevuto buone notizie. "Vi ha riconosciuto", dice. "Tutti."
  else:
    > Solo alcuni degli eredi salgono sul carro. Gli altri restano alla tenuta, davanti al camino, a ripetersi che qualcuno, in famiglia, deve pur conservare un po' di buon senso.

    > Verso l'una di notte, dalla direzione del villaggio, arriva un grido. Poi un altro. Poi una risata, che potrebbe essere di chiunque. Chi torna all'alba non vuole raccontare che cosa ha visto; ma ha le mani fredde come quelle di Madame, e per tutta la mattina continua a guardare le pareti.
  block setupEvent next=G1Patroni:
    ! Chi ha votato YAY guadagna 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
    ! Chi ha votato NAY arretra di 1 casella sul tracciato {icon:Creepy_Icon}.

:: G1Patroni
  # **Il sermone**
  ! **Gazzetta di {$townname} – *gennaio 1849.***
  > **LA STREGA DEL CARRO.** Domenica scorsa il reverendo Padre Anzelm ha dedicato l'intero sermone a quella che ha chiamato, senza giri di parole, "la strega del carro". Ha ricordato ai fedeli che i morti riposano nelle mani di Dio e non nei cassetti di un tavolino, e che chi li disturba per denaro disturba anche Lui. Ha poi aggiunto, guardando verso i banchi in fondo, che certe famiglie arrivate di recente farebbero bene a ricordarselo.

  > Il sermone è stato molto apprezzato. Lunedì, tuttavia, questo giornale ha potuto osservare un insolito via vai di signore in nero sulla strada della tenuta. Le vedove di {$townname} hanno perso mariti, figli e fratelli per il freddo, le febbri e la fame; vogliono notizie dei loro cari, e per i propri cari, si sa, non si bada a spese.
  if $tubo == "ascoltato":
    > Il becchino del cimitero, interrogato da questo giornale, conferma che di notte qualcuno della tenuta va ad ascoltare il tubo d'ottone che spunta dalla tomba del vecchio. Non dice che cosa si senta. Dice che, da allora, il campanello non ha più bisogno del vento.
  elif $tubo == "sigillato":
    > Il fabbro, che ha colato il piombo nel tubo della tomba del vecchio alla presenza del reverendo, racconta di avere sentito il metallo sibilare come una teiera. Il reverendo lo ha pregato di non raccontarlo.
  if $joska == "amico":
    > Si segnala inoltre che il figlio del fabbro, un bambino di sei anni, gira per il paese insegnando a tutti un gioco nuovo, che consiste nel bussare ai muri in un certo ordine. Le madri sono pregate di sorvegliare i figli.
  if $trucchi > 0:
    > Qualcuno sostiene che sotto il tavolino del carro ci sia un pedale. Madame Vámos, interpellata, ha invitato chi lo sostiene a sedersi al suo posto, e a provare.

  ! E la tua famiglia, la domenica dopo?
  [[Va a messa, in prima fila. ~> messa]]
  [[Apre il cancello alle signore in nero. ~> vedove]]
  fragment messa:
    set fede = $fede - 1
    > La famiglia della tenuta va a messa al completo, in prima fila, con i vestiti migliori e le facce di chi non ha dormito. Padre Anzelm, dal pulpito, la fissa per un pezzo e cambia la fine del sermone: parla del figliol prodigo. Le signore in nero, in fondo alla chiesa, si scambiano occhiate.
    [[Clicca per continuare... ~> 0]]
  fragment vedove:
    set fede = $fede + 1
    > La domenica mattina, mentre le campane suonano, la famiglia della tenuta apre il cancello. Le signore in nero salgono la strada a due a due, con il velo abbassato, e si siedono nel salotto grande, sotto il ritratto del padre, a raccontare dei loro morti. Nessuno di voi fa niente di speciale: ascoltate, e basta. Le signore se ne vanno all'ora di pranzo, consolate. Padre Anzelm, quella domenica, predica a mezza chiesa.
    [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G1R2:
      set _SetupImage = "S1_DubiousBartering"
      ! Dalla Scatola di **The Cost of Disease** prendete i **Charity token** {icon:S1_HeartToken} e le **6 Dubious Bartering card**. In questo scenario i cuori sono il **Conforto** che date alle famiglie in lutto.
      ! Mescolate le Dubious Bartering card e datene una scoperta a ogni giocatore: è il suo patrono. Rimettete le altre nella scatola.
      ! Mettete i Charity token nella riserva.
      ! Prendete anche le **10 Estate Upgrade** della scatola e mescolatele nel mazzo delle Migliorie della Generazione I/II.

:: G1R2 [HUB]
  # **IL VELO SOTTILE – Maturità**
  set round = 2
  if $hub != "G1R2":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Andate a **pagina 2** della Village Chronicle, sezione **The Cost of Disease** ({icon:S1_ScenarioIcon}).
  set hub = "G1R2"
  include Traguardi
  block hubTitle:
    ! {icon:S1_HeartToken} **Conforto**
  block hubDetails:
    ! Il tuo patrono ti dà un cuore ogni volta che fai quello che dice la sua Dubious Bartering card. In Chiesa, il cuore stampato sulla pagina ti fa guadagnare un Charity token.
  if !$evBanca:
    block hubTitle:
      ! {icon:Storybook} **Il conto del padre – Bank**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Bank [[clicca qui. -> G1Banca]]
  if !$evVedova:
    block hubTitle:
      ! {icon:Storybook} **La vedova del mugnaio – Farmer's Market**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Farmer's Market [[clicca qui. -> G1Vedova]]
  if !$evStagno:
    block hubTitle:
      ! {icon:Storybook} **Il ghiaccio – Park**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Park [[clicca qui. -> G1Stagno]]
  if !$evTerreno:
    block hubTitle:
      ! {icon:Storybook} **Il terreno accanto al cimitero – Builder's Office**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Builder's Office [[clicca qui. -> G1Terreno]]
  if !$evChiavi:
    block hubTitle:
      ! {icon:Storybook} **Le chiavi della tenuta – Blacksmith**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Blacksmith [[clicca qui. -> G1Chiavi]]
  block hubTitle:
    ! **Evento del secondo Round**
  block hubDetails:
    > Qualcuno nel villaggio scrive lettere, e non le firma. Le buste arrivano senza francobollo, e nessuno le ha viste arrivare.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G1R2" next="G1Lettere"

::round G1R2 2
fine: La Maturità della Prima Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Vecchiaia prima di continuare.

:: G1Banca
  set evBanca = true
  # **Il conto del padre**
  > La Bank di {$townname} è una stanza sola, con una grata d'ottone, una cassaforte grande come un armadio e un banchiere, il signor Weisz, che porta le mezze maniche anche la domenica. Ti riceve con l'imbarazzo di chi deve dare una notizia che non sa se sia buona.

  > Il conto di tuo padre, spiega, non si è chiuso con la sua morte. Da vent'anni, il primo di ogni mese, da Vienna arriva un versamento sempre uguale, firmato soltanto con tre iniziali: **C. U. O.** È arrivato anche questo mese. "Come se il mittente", dice il signor Weisz, aggiustandosi gli occhiali, "non fosse stato informato. O come se non lo ritenesse importante."
  ! Che cosa fai?
  [[Prelevi il denaro. ~> preso]]
  [[Fai restituire tutto al mittente. ~> restituito]]
  [[Chiedi al banchiere di vedere la firma. ~> chiesto]]
  fragment preso:
    set denaro = "preso"
    set fede = $fede + 1
    > Il signor Weisz conta le banconote due volte, con le dita bagnate, e te le consegna in una busta. Quella sera, svuotando la busta sul tavolo del laboratorio, ne cade un biglietto che il banchiere giura di non avere visto. Una riga sola, in una calligrafia elegante e antiquata: *"Per le spese di famiglia. Ci sono sempre spese, in una famiglia."*
    block setupEvent next=$hub:
      ! Guadagni $3.
  fragment restituito:
    set denaro = "restituito"
    set fede = $fede - 1
    > Firmi l'ordine di restituzione, e il signor Weisz lo spedisce a Vienna con la diligenza del giovedì. Il primo del mese successivo il versamento arriva puntuale, raddoppiato, con una nota del corrispondente: *"Insistiamo."*

    > Lo fai restituire di nuovo. La voce gira, come girano tutte le voci di {$townname}: la famiglia della tenuta rifiuta il denaro, e chi rifiuta il denaro, al villaggio, o è un santo o ha qualcosa da nascondere.
    block setupEvent next=$hub:
      ! Guadagni 2VP.
  fragment chiesto:
    set denaro = "chiesto"
    set velo = $velo + 1
    > Il signor Weisz esita, poi apre il registro. Accanto a ogni versamento, dove dovrebbe esserci la firma del mittente, c'è un piccolo disegno a inchiostro: un garofano, annerito con cura. Sotto il primo, quello del 1828, c'è anche un nome per esteso: *O. Garai*.

    > L'ultimo versamento, quello di questo mese, porta lo stesso disegno e lo stesso nome, nella stessa calligrafia, con la stessa pressione della penna. "Un figlio, immagino", dice il banchiere. "O un nipote. Le famiglie per bene si tramandano la firma, come l'argenteria."
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge).

:: G1Vedova
  set evVedova = true
  # **La vedova del mugnaio**
  > Al Farmer's Market, tra le ceste di uova e le gabbie dei polli, una donna vestita di nero ti trattiene per la manica. È Panna Kovács, la vedova del mugnaio. Il marito è morto di colera l'estate scorsa, in tre giorni, senza riuscire a dire dove avesse nascosto i risparmi di trent'anni; e lei, con quattro figli e un mulino fermo, vende le uova delle sue galline per pagare il pane.

  > "Voi parlate con i morti", ti dice, senza abbassare la voce. "Lo sa tutto il paese. Madame vuole un fiorino per seduta, e io un fiorino non ce l'ho. Chiedetegli voi dove sono i soldi. A voi risponderà: siete gente istruita."
  ! Che cosa fai?
  [[Improvvisi una seduta e tiri a indovinare. ~> truffa]]
  [[La accompagni da Madame Vámos, e paghi tu. ~> madame]]
  [[Le dici la verità: non sai parlare con i morti. ~> verita]]
  fragment truffa:
    set mulino = "truffa"
    > La porti dietro il banco del pane, le prendi le mani e chiudi gli occhi, come hai visto fare a Madame. Dopo un tempo che ti sembra decente dici la prima cosa che ti viene in mente: dietro la stufa, un mattone smosso. La vedova ti bacia le mani e corre al mulino.

    > Torna la sera, coperta di fuliggine: dietro la stufa non c'era niente. Ma non è arrabbiata. Dice che il marito non si fidava di nessuno, nemmeno da morto, e che però lei, per la prima volta da mesi, ha dormito. Il giorno dopo, nel paese, si racconta che la famiglia della tenuta consola le vedove gratis.
    block setupEvent next=$hub:
      ! Guadagni 1 Charity token {icon:S1_HeartToken}.
  fragment madame:
    set mulino = "madame"
    set velo = $velo + 1
    set fede = $fede + 1
    > Madame Vámos accetta il tuo fiorino senza guardarlo. La seduta è breve: la medium tace a lungo, poi parla con una voce roca, da uomo, e dice di contare le pale della ruota, da sinistra, fino alla settima.

    > Sotto la settima pala, in una scatola di latta incastrata tra le assi, ci sono i risparmi del mugnaio, fino all'ultimo kreuzer. La vedova piange, ride, giura che da domenica andrà alle sedute del giovedì invece che a messa. Tu ti chiedi come facesse Madame a saperlo; e se lo sapesse da prima che tu la pagassi.
    block setupEvent next=$hub:
      ! Guadagni 1 Charity token {icon:S1_HeartToken} e 1 {icon:Creepy_Icon}.
  fragment verita:
    set mulino = "verita"
    > Le dici che no, non sai parlare con i morti, e che chi giura di saperlo, di solito, vuole un fiorino. La vedova resta zitta per un momento. Poi ti ringrazia: in tutto il paese sei la prima persona che non le ha promesso niente.

    > Prima di andarsene ti mette tra le braccia la sua gallina migliore, che si dibatte e protesta. Rifiutarla sarebbe un'offesa; e nel laboratorio, si sa, un animale serve sempre.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Animal_Icon}.

:: G1Stagno
  set evStagno = true
  # **Il ghiaccio**
  ! **Gazzetta di {$townname} – *gennaio 1852.***
  > **DISGRAZIA ALLO STAGNO.** Domenica pomeriggio il piccolo Péter Szűcs, detto Peti, di otto anni, figlio del bottaio, è caduto attraverso il ghiaccio dello stagno del parco, dove giocava con altri bambini malgrado il divieto. Il corpo è stato recuperato soltanto ieri, dopo tre giorni di ricerche.

  > Chi lo ha visto racconta un fatto singolare: il bambino non sembrava annegato, ma addormentato, con le guance rosee e le labbra appena socchiuse. Il medico ha attribuito la cosa al freddo. La madre si rifiuta di farlo seppellire. Madame Vámos si è offerta di vegliarlo una notte intera. Il bottaio, si dice, ha debiti, e la famiglia della tenuta compra corpi per i suoi studi.
  ! Che cosa fai?
  [[Paghi il funerale e la lapide. ~> sepolto]]
  [[Chiedi il corpo per i tuoi studi. ~> corpo]]
  [[Lasci che Madame lo vegli. ~> vegliato]]
  fragment sepolto:
    set peti = "sepolto"
    set velo = $velo - 1
    set fede = $fede - 1
    > Paghi una bara bianca, una lapide piccola con un angelo e il pranzo per il paese dopo la messa. Padre Anzelm celebra con gli occhi lucidi. La madre di Peti non ti ringrazia: non parla con nessuno. Ma il giorno dopo, sulla soglia della tenuta, trovi un cesto di mele avvolte nella paglia, e nessun biglietto.
    block setupEvent next=$hub:
      ! Guadagni 1 Charity token {icon:S1_HeartToken}.
  fragment corpo:
    set peti = "corpo"
    > Il bottaio accetta il denaro senza guardarti in faccia. Il corpo arriva alla tenuta di notte, su un carretto coperto di sacchi. Nel laboratorio lo esamini a lungo, al lume della lampada: niente acqua nei polmoni, nessun segno di lotta, il cuore fermo come un orologio a cui nessuno ha dato la carica.

    > Prendi appunti per tutta la notte. All'alba, quando alzi gli occhi dal quaderno, ti sembra che le palpebre del bambino si siano mosse. Non sono le tue: sono le sue. Chiudi il quaderno, e per un mese non lo riapri.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Bodies_Icon} e 1 {icon:Creepy_Icon}.
  fragment vegliato:
    set peti = "vegliato"
    set velo = $velo + 1
    set fede = $fede + 1
    > Madame Vámos veglia il bambino nella bottega del bottaio, tra le doghe e i cerchi di ferro, con una candela sola. Tu resti sulla soglia, perché qualcuno della famiglia deve esserci: lei lo ha chiesto espressamente.

    > Verso le tre la medium si china sul piccolo corpo, gli parla all'orecchio, ascolta. Poi si volta verso la madre e le dice che Peti ha freddo, ma non ha paura, e che giocherà ancora con gli altri bambini, quando verrà la nebbia. Il giorno dopo lo seppelliscono. La madre, al funerale, sorride.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e 1VP.

:: G1Terreno
  set evTerreno = true
  # **Il terreno accanto al cimitero**
  > Al Builder's Office ti aspetta un giovane impiegato con un garofano nero all'occhiello e una cartella di cuoio sotto il braccio. Rappresenta, dice, "una società di persone benestanti e riservate" che desidera acquistare la striscia di terra della tua famiglia tra il cimitero e la strada maestra: un prato di ortiche dove pascolano le capre del becchino.

  > Il prezzo che offre è il doppio di quanto valga, e il triplo di quanto qualcuno, a {$townname}, abbia mai pagato per un prato di ortiche. Il capomastro, alle sue spalle, ti fa segno di accettare con tutta la faccia.
  ! Che cosa fai?
  [[Vendi. ~> vendi]]
  [[Rifiuti: la terra della famiglia non si vende. ~> rifiuta]]
  [[Chiedi che cosa vogliono costruirci. ~> chiedi]]
  fragment vendi:
    set terreno = "venduto"
    set fede = $fede + 1
    > Firmi, e il giovane ti paga in monete d'oro, contate una per una su un fazzoletto di seta nera. Le capre del becchino vengono spostate il giorno dopo. Per anni sul prato non si costruisce niente; ma ogni tanto, di notte, qualcuno ci passeggia con una lanterna, misurando a passi la distanza dalle tombe.
    block setupEvent next=$hub:
      ! Guadagni $3.
  fragment rifiuta:
    set terreno = "rifiutato"
    set fede = $fede - 1
    > Il giovane non insiste. Ripone la cartella, ti augura una buona giornata e se ne va. Una settimana dopo la società compra il terreno accanto, dall'altra parte del cimitero, al prezzo di un prato di ortiche. Il capomastro ti guarda come si guarda qualcuno che ha rifiutato una dote.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment chiedi:
    set terreno = "chiesto"
    > Il giovane esita, poi apre la cartella e ti mostra un disegno: un edificio basso, elegante, con un campanile senza campana; e dal campanile partono decine di fili sottili, tesi come le corde di un'arpa, che scendono fino alle tombe del cimitero, una per una. "Una casa per il riposo", dice. "Dei vivi, s'intende."

    > Non vendi. Ma il disegno, a casa, lo copi a memoria, e lo rifai tre volte prima di capire a che cosa servano i fili.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Ingegneristica (Engineering Knowledge).

:: G1Chiavi
  set evChiavi = true
  # **Le chiavi della tenuta**
  > Il fabbro ti prende da parte, vicino alla forgia, con l'aria di chi si toglie un peso. L'estate scorsa, poco prima che il padre morisse, un signore elegante con un garofano nero all'occhiello gli ha ordinato le copie di tutte le chiavi della tenuta: il cancello, il portone, lo studio, la cantina, perfino lo scrittoio. Gli ha portato gli stampi di cera già fatti.

  > "La cosa strana", dice il fabbro, abbassando la voce, "è che gli stampi me li ha portati il vostro signor padre in persona, il giorno prima. Me li ha messi in mano e ha detto: quando verrà a ritirarli un signore con un fiore nero, dateglieli. È tutto pagato."
  if $joska == "amico":
    > Dietro la forgia, Jóska ascolta tutto con gli occhi spalancati, e ti fa un cenno, come tra complici.
  ! Che cosa fai?
  [[Fai cambiare tutte le serrature della tenuta. ~> serrature]]
  [[Ti fai fare anche tu una copia: la chiave della casa del Circolo. ~> copia]]
  [[Lasci tutto com'è: era la volontà di tuo padre. ~> lascia]]
  fragment serrature:
    set velo = $velo - 1
    > Il fabbro cambia tutte le serrature in una settimana, e la tenuta, per qualche notte, sembra più silenziosa. Poi una mattina trovi la porta dello studio aperta, la chiave nuova infilata nella toppa dall'interno, e il Journal sulla scrivania aperto all'ultima pagina, quella con la frase sottolineata due volte.
    block setupEvent next=$hub:
      ! Se puoi, paga $2: guadagni 2VP. Altrimenti guadagni 1VP.
  fragment copia:
    set trucchi = $trucchi + 1
    > Il fabbro conserva gli stampi di tutti i suoi clienti, anche quelli del Circolo. Per qualche moneta te ne fa una copia: una chiave lunga e scura, con un occhio traforato nell'impugnatura. Apre una porta sul retro della casa in piazza. Una notte la usi: dietro la porta ci sono una scala, una cantina e, contro il muro, un martelletto imbottito appeso a una corda.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Gears_Icon} e 1 {icon:Creepy_Icon}.
  fragment lascia:
    set velo = $velo + 1
    > Lasci le cose come sono. Il signore con il garofano non viene mai, almeno non di giorno. Ma una notte senti il cancello che si apre, il portone che si apre, la porta dello studio che si apre, una dopo l'altra, senza fretta, con le chiavi giuste. Al mattino non manca niente. Sulla scrivania c'è un garofano nero.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge).

:: G1Lettere
  # **Lettere senza firma**
  > Negli anni della maturità la famiglia comincia a ricevere posta che il postino non ha mai consegnato. Le lettere compaiono sotto la porta, nel cestino del pane, una volta perfino dentro il Journal del padre, chiuso a chiave nello scrittoio. Sono buste di carta pesante, senza indirizzo e senza firma, sigillate con ceralacca nera; nella ceralacca, un occhio aperto.

  > Dentro, ogni volta, poche righe in una calligrafia elegante e antiquata. Il **Circolo dell'Ultima Ora** saluta gli eredi del grande scienziato, conosce i loro lavori, ammira il loro coraggio e desidera incontrarli, uno per uno, in un luogo discreto. Basterà presentarsi all'indirizzo indicato e pronunciare la parola giusta.
  if $denaro == "preso":
    > La famiglia, intanto, ha cominciato a ritirare ogni mese il denaro che arriva da Vienna. Nessuno ne parla a tavola. Ma le lettere senza firma, da quel momento, arrivano più spesso, e sono più affettuose.
  elif $denaro == "restituito":
    > La famiglia, intanto, continua a rimandare a Vienna il denaro che arriva ogni mese, e ogni mese il denaro torna, raddoppiato. Le lettere senza firma, da quel momento, hanno un tono offeso, come quelle di una zia trascurata.
  if $mulino == "madame":
    > Al mercato, la vedova del mugnaio racconta a chiunque voglia ascoltarla dei risparmi trovati sotto la settima pala, e di chi l'ha portata da Madame. Il giovedì, alle sedute, c'è la fila.
  elif $mulino == "truffa":
    > Al mercato, la vedova del mugnaio racconta a chiunque voglia ascoltarla della seduta dietro il banco del pane. Non ha trovato niente, dice; ma per la prima volta ha dormito. In paese si comincia a dire che la famiglia della tenuta consola meglio del prete.
  if $peti == "corpo":
    > Dalla bottega del bottaio, la notte, si sente piangere. In paese si dice che la famiglia della tenuta abbia comprato un bambino morto, e che lo tenga in un armadio di vetro. Non è vero; ma non è nemmeno del tutto falso.
  elif $peti == "vegliato":
    > La madre di Peti va a tutte le sedute del giovedì, in prima fila, e ogni tanto ride da sola.
  if $terreno == "venduto":
    > Sul prato accanto al cimitero, quello che la famiglia ha venduto, qualcuno ha piantato dei paletti con lo spago, in file regolari, come per un orto. O per un altro cimitero.

  ! Che cosa ne fate, di queste lettere?
  [[Rispondete, per iscritto, lasciando la busta sotto la porta. ~> rispondi]]
  [[Le bruciate senza finire di leggerle. ~> brucia]]
  fragment rispondi:
    set velo = $velo + 1
    > La risposta la scrive chi in famiglia ha la calligrafia più bella, su carta della tenuta, con poche righe cortesi e prudenti. La busta, lasciata la sera sotto la porta, la mattina non c'è più. Al suo posto c'è un garofano nero, fresco, con una goccia di rugiada che non cade.
    [[Clicca per continuare... ~> 0]]
  fragment brucia:
    set velo = $velo - 1
    > Le lettere bruciano bene, con una fiamma alta e allegra, e per qualche giorno non ne arrivano altre. Poi una mattina, nel camino spento, tra la cenere, c'è una busta intatta, con la ceralacca nera e l'occhio aperto. Non è nemmeno annerita.
    [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G1R3:
      set _SetupImage = "S1_LetterBACK"
      ! Dalla Scatola di **The Cost of Disease** prendete le **Letter card** e tenete solo le **4** che nominano il **Builder's Office** o il **Cemetery**. Rimettete le altre nella scatola.
      ! Mescolatele e datene una coperta a ogni giocatore. Ognuno legge in segreto la propria.

:: G1R3 [HUB]
  # **IL VELO SOTTILE – Vecchiaia**
  set round = 3
  if $hub != "G1R3":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $fede < 0:
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 1**.
      else:
        ! Andate a **pagina 3** della Village Chronicle, sezione **The Cost of Disease** ({icon:S1_ScenarioIcon}).
  set hub = "G1R3"
  include Traguardi
  if !$evSacrestia:
    block hubTitle:
      ! {icon:Storybook} **La porta della sacrestia – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G1Sacrestia]]
  if !$evSindaco:
    block hubTitle:
      ! {icon:Storybook} **Il voto del Sindaco – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G1Sindaco]]
  if !$evStudente:
    block hubTitle:
      ! {icon:Storybook} **Lo studente di medicina – Farmer's Market**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Farmer's Market [[clicca qui. -> G1Studente]]
  if !$evLezione:
    block hubTitle:
      ! {icon:Storybook} **La lezione – Traveling Caravan**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Traveling Caravan [[clicca qui. -> G1Lezione]]
  if !$evPanchina:
    block hubTitle:
      ! {icon:Storybook} **La panchina – Park**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Park [[clicca qui. -> G1Panchina]]
  block hubTitle:
    ! {icon:Storybook} **Letter card**
  block hubDetails:
    ! Quando visiti il Luogo nominato dalla tua Letter card, rivelala e [[clicca qui per inserire la parola d'ordine. -> G1Parola]]
  block hubTitle:
    ! **Fine della Generazione**
  block hubDetails:
    > Il villaggio dovrà decidere che cosa fare della donna del carro.
  [[Clicca qui alla Fine della Generazione per continuare... ~> 0]]
  fragment 0:
    ui endOfRound progress="G1R3" next="G1Fine"

::round G1R3 0
fine: La Vecchiaia della Prima Generazione è finita.
poi: Eseguite le azioni di Fine Round, poi continuate con lo Storybook prima della Fine della Generazione.

:: G1Sacrestia
  set evSacrestia = true
  # **La porta della sacrestia**
  > Padre Anzelm ti aspetta sul sagrato con il cappello in mano, e questo, da solo, è già abbastanza strano. Ti porta nella sacrestia vecchia, quella dietro l'abside che non si usa più da quando hanno costruito la nuova, e ti mostra una porticina bassa di legno scuro, chiusa da un catenaccio arrugginito.

  > "Da tre settimane", dice, "qualcuno bussa lì dietro. Di notte, durante il vespro, perfino durante la messa. Ho aperto: è un ripostiglio vuoto, grande come un confessionale. Ho benedetto: bussano lo stesso." Si passa una mano sulla faccia. "Voglio farla murare. Il muratore chiede tre fiorini, e la parrocchia non li ha. Voi, invece, i colpi li conoscete bene."
  ! Che cosa fai?
  [[Paghi il muratore: la porta va murata. ~> murata]]
  [[Chiedi di aprirla un'ultima volta, prima. ~> aperta]]
  fragment murata:
    set porta = "murata"
    set velo = $velo - 1
    set fede = $fede - 1
    > Il muratore lavora un pomeriggio intero, in silenzio, mattone su mattone, mentre il prete recita il rosario sulla soglia. Quando l'ultimo mattone è al suo posto, i colpi si fermano. Padre Anzelm ti stringe tutte e due le mani: è la prima volta che lo vedi sorridere.

    > Uscendo, guardi il muro fresco di calce. Hai la sensazione, che non sai spiegarti, che un giorno qualcuno lo riaprirà, e che troverà dietro qualcosa che adesso non c'è.
    block setupEvent next=$hub:
      ! Guadagni 1VP e arretra di 1 casella sul tracciato {icon:Insanity_Icon}.
  fragment aperta:
    set porta = "aperta"
    set velo = $velo + 1
    > Il prete toglie il catenaccio di malavoglia. Il ripostiglio è vuoto, polveroso, con un odore di cera vecchia. Ma l'interno della porta, all'altezza di una testa, è coperto di segni di nocche: centinaia di piccole ammaccature nel legno, alcune vecchie e scurite, altre chiare come se fossero di stanotte.

    > In un angolo, sotto la polvere, c'è un registro rilegato in pergamena: esorcismi celebrati in quella sacrestia dal 1711 al 1763, con i nomi, le date e, a margine, il numero dei colpi uditi. Il prete te lo lascia portare via, purché tu non gliene parli mai più. Il giorno dopo la porta viene murata lo stesso.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Creepy_Icon}.

:: G1Sindaco
  set evSindaco = true
  # **Il voto del Sindaco**
  > Il Sindaco Bódi ti riceve nel suo ufficio, una stanza con un ritratto dell'imperatore, una stufa che fuma e un armadio pieno di pratiche che nessuno ha mai letto. È un uomo grasso e cortese, con le mani sempre umide, e conosce il prezzo di tutto: delle vacche, dei voti, delle anime.

  > "Il consiglio dovrà decidere della signora del carro", dice, senza che tu glielo abbia chiesto. "Il parroco mi ha già fatto visita. E anche un signore molto elegante, con un fiore all'occhiello. Tutti mi chiedono di parlare. Nessuno mi chiede di che cosa abbia bisogno io." Sospira. "La famiglia della tenuta, almeno, è gente ragionevole."
  ! Che cosa fai?
  [[Gli offri denaro perché parli in favore di Madame. ~> comprato]]
  [[Gli ricordi i debiti di suo padre con il tuo. ~> ricattato]]
  [[Gli chiedi di parlare contro la medium. ~> chiesa]]
  fragment comprato:
    set bodi = "comprato"
    set fede = $fede + 1
    > Il Sindaco conta le monete sulla scrivania con la naturalezza di chi conta le pecore. Promette che parlerà, e che parlerà bene. Poi, accompagnandoti alla porta, ti confida che il signore con il fiore all'occhiello gli aveva offerto il doppio, "ma con voi, si sa, è diverso: siete gente del posto".
    block setupEvent next=$hub:
      ! Se puoi, paga $2: guadagni 3VP. Altrimenti non succede niente.
  fragment ricattato:
    set bodi = "ricattato"
    > Tiri fuori dal Journal una ricevuta ingiallita: un prestito che tuo padre fece al vecchio Bódi, trent'anni fa, e che nessuno ha mai restituito. Il Sindaco impallidisce, poi arrossisce, poi ride, e la risata non gli arriva agli occhi.

    > "Parlerò come volete", dice. "Ma i Bódi hanno buona memoria. Mio figlio la avrà, e il figlio di mio figlio." Esci con la ricevuta in tasca e la sensazione di avere fatto un pessimo affare.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Creepy_Icon}.
  fragment chiesa:
    set bodi = "chiesa"
    set fede = $fede - 1
    > Il Sindaco ascolta, annuisce, ti dà ragione su tutto. Parlerà contro la medium, dice, perché il villaggio ha bisogno di ordine e di messe, non di tavolini. Non ti chiede niente in cambio, e questo ti insospettisce più di qualunque richiesta.

    > Due giorni dopo vieni a sapere che la parrocchia gli ha condonato l'affitto di un campo per dieci anni. Padre Anzelm, quando lo incontri, ti saluta come si saluta un alleato.
    block setupEvent next=$hub:
      ! Guadagni $2.

:: G1Studente
  set evStudente = true
  # **Lo studente di medicina**
  > Tra le bancarelle del Farmer's Market c'è un giovane con il cappotto liso, gli occhiali tondi e un taccuino aperto sul palmo. Si chiama Béla Lukács, nipote del medico condotto: studia medicina a Vienna e passa l'estate al villaggio a prendere appunti su tutto, dalle malattie delle vacche ai miracoli della signora del carro.

  > "Non credo ai fantasmi", ti dice, prima ancora di presentarsi. "Credo agli esperimenti. Ho preparato una busta sigillata con un numero dentro: lo conosco solo io. Se Madame Vámos lo legge senza aprirla, mi converto. Ma a me non lascia entrare nel carro." Ti porge la busta. "Voi, invece, sì."
  ! Che cosa fai?
  [[Lo aiuti: porti la busta alla seduta. ~> amico]]
  [[Gli ridi in faccia. ~> deriso]]
  fragment amico:
    set lukacs = "amico"
    set trucchi = $trucchi + 1
    > Alla seduta posi la busta sul tavolino. Madame la sfiora appena con la punta delle dita, chiude gli occhi e dice: "Quarantasette". Il giorno dopo il giovane Lukács apre la busta davanti a te. C'è scritto quarantasette.

    > Lui però non si converte. Prende la busta, la gira contro la luce della finestra, gratta il sigillo con l'unghia. "Vapore", dice, mostrandoti un'ombra lungo il bordo della ceralacca. "Qualcuno l'ha aperta e richiusa. Non so quando, né come. Ma lo scoprirò." Ti saluta con un piccolo inchino: ha trovato, dice, la prima persona ragionevole del villaggio.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge).
  fragment deriso:
    set lukacs = "deriso"
    > Gli ridi in faccia: in una famiglia di scienziati, uno studente con una busta è un dilettante. Il giovane Lukács arrossisce fino alle orecchie, si rimette la busta in tasca e se ne va senza salutare.

    > Qualcuno, al mercato, ride con te. Lui si volta una volta sola, dall'angolo della strada, e ti guarda come si guarda un problema da risolvere.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G1Lezione
  set evLezione = true
  # **La lezione**
  > Il carro di Madame Vámos non si muove da otto anni: le ruote sono affondate nel fango, sul tetto è cresciuta l'erba e le tende di velluto hanno preso il colore della ruggine. Madame ti fa entrare, ti serve un tè nero in una tazza sbeccata e ti studia con la testa inclinata, come si guarda un cavallo prima di comprarlo.

  > "Avete l'orecchio", dice. "Lo aveva anche vostro padre, ma lo usava per parlare. Io posso insegnarvi ad ascoltare. Non vi chiedo denaro." Sorride. "Il denaro, con la vostra famiglia, viene dopo."
  ! Che cosa fai?
  [[Accetti le lezioni. ~> accetta]]
  [[Accetti, ma per scoprire i suoi trucchi. ~> trucchi]]
  [[Rifiuti, e te ne vai. ~> rifiuta]]
  fragment accetta:
    set allievo = true
    set velo = $velo + 1
    > Le lezioni durano tutto l'inverno, il giovedì sera. Madame ti insegna a respirare piano, a contare i colpi, a lasciare le mani sul tavolino senza spingere. Ti insegna anche i trucchi, il pedale, il filo, la voce di gola, e lo fa con la stessa serietà con cui ti insegna il resto. "I trucchi servono per i giorni in cui non rispondono", dice. "Ma un giorno risponderanno a voi. Allora non avrete bisogno di me."
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment trucchi:
    set trucchi = $trucchi + 1
    > Madame capisce subito il vero motivo delle tue visite, e non se ne offende. Anzi, ti insegna i trucchi con un orgoglio di artigiana: il pedale, il filo di seta, il fosforo sciolto nell'olio, la voce che si fa uscire dalla gola senza muovere le labbra. Li scrivi tutti, in un quaderno.

    > All'ultima lezione, chiudendo il quaderno, ti dice una cosa sola: "I trucchi sono la parte facile. Il difficile è smettere di usarli quando non servono più."
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge).
  fragment rifiuta:
    set velo = $velo - 1
    > Posi la tazza e ti alzi. Madame non ti trattiene. "Come volete", dice, accompagnandoti alla porta del carro. "Non importa. Verrà qualcuno dei vostri figli, o dei figli dei vostri figli. Il vostro sangue torna sempre." Sulla soglia ti mette in mano un biscotto alle spezie, come si fa con i bambini.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G1Panchina
  set evPanchina = true
  # **La panchina**
  > Nel Park, vicino allo stagno, c'è una panchina di ghisa con una targhetta d'ottone: *Dono della famiglia della tenuta, 1840*. Ogni sera, al tramonto, ci siede una vecchia con uno scialle grigio e un cestino sulle ginocchia, e guarda verso la collina. Qualcuno ti dice che era l'infermiera del padre, nell'ultimo anno.

  > Quando ti siedi accanto a lei non si stupisce. "Avete i suoi occhi", dice. "Lui non voleva morire nel letto. Voleva morire seduto, sulla sedia accanto, con gli occhi aperti. Diceva che così l'avrebbe vista arrivare."
  ! Che cosa fai?
  [[Le chiedi delle sue ultime ore. ~> ore]]
  [[Le lasci del denaro: deve vivere di poco. ~> denaro]]
  [[Fai togliere la targhetta dalla panchina. ~> targa]]
  fragment ore:
    set velo = $velo + 1
    > La vecchia racconta senza fretta: la febbre, il delirio, le formule dette a voce alta come preghiere. Alla fine, dice, il padre si calmò, guardò la porta e disse, chiaro: *"Eccomi. Puntuale come sempre."* Poi bussò una volta, con la nocca, sul bracciolo della sedia. "E qualcuno rispose", dice la vecchia, guardando la collina. "Io c'ero."
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment denaro:
    > La vecchia prende il denaro, lo conta, lo mette nel cestino sotto un fazzoletto. Ti ringrazia come si ringrazia un parente. Da quel giorno, ogni settimana, sulla soglia della tenuta compare un vasetto di marmellata di more, con un biglietto scritto in stampatello: *"Per gli occhi."*
    block setupEvent next=$hub:
      ! Guadagni 1 Charity token {icon:S1_HeartToken}.
  fragment targa:
    set velo = $velo - 1
    > Il fabbro svita la targhetta in un pomeriggio. La panchina resta, anonima, e la vecchia continua a sedersi lì ogni sera, ma guarda dall'altra parte, verso il paese. Una settimana dopo, al posto della targhetta, qualcuno ha inciso con un coltello due iniziali: una è quella del padre. L'altra è una E.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G1Parola
  set parola = ""
  prompt parola text: Scrivi la parola d'ordine della tua Letter card.
  goto G1ParolaVerifica

:: G1ParolaVerifica
  if $parola == "howl" || $parola == "Howl" || $parola == "bolt" || $parola == "Bolt" || $parola == "right" || $parola == "Right" || $parola == "cross" || $parola == "Cross":
    set dopo = "G1Patto"
    goto ChiSei
  # **Nessuna risposta**
  ! Il Circolo non riconosce questa parola. Controlla la tua Letter card.
  [[Riprova. -> G1Parola]]
  [[Torna al Round. => $hub]]

:: G1Patto
  @@ **Questa pagina è segreta: non mostrarla agli altri.**
  # **Il Circolo dell'Ultima Ora**
  ! Guadagni 2VP, come dice la tua Letter card.
  > Ti aspetta un uomo alto, in un cappotto troppo elegante per {$townname}, con un garofano nero all'occhiello. Non ti chiede chi sei. Ti chiama per nome, ti offre il braccio e cammina con te, lentamente, come si fa tra vecchi amici.

  > "Il Circolo dell'Ultima Ora", dice, "è una piccola società di persone che non si rassegnano. Abbiamo perso qualcuno, tutti quanti; e tutti abbiamo scoperto che i morti non sono lontani come dicono i preti. Madame Vámos è la nostra voce. Vostro padre era… diciamo un corrispondente."

  > Ti porge una busta, gonfia di fogli. "Qui ci sono cose che lui sapeva e che non ha avuto il tempo di insegnarvi. Sono vostre. In cambio chiediamo soltanto una promessa: che un giorno, quando il Circolo ve lo chiederà, aprirete la porta."

  > Non dice quale porta. Sorride come se lo sapessi già.
  [[Accetti. ~> si]]
  [[Rifiuti. ~> no]]
  fragment si:
    set velo = $velo + 1
    set fede = $fede + 1
::for L in A B C D
    if $chi == "%L%":
      set patto%L% = true
::endfor
    > Stringi la mano dell'uomo. È fredda come quella di Madame, e nella tua non si scalda. "Il Circolo vi ringrazia", dice, e si allontana senza voltarsi.

    > La busta pesa più di quanto dovrebbe. Quella sera, leggendola alla luce della lampada, ti accorgi che alcune pagine sono scritte con la calligrafia di tuo padre, e che una di esse porta la data di due settimane dopo la sua morte.
    block setupEvent next=$hub:
      ! Guadagni 2 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Creepy_Icon}. Rimetti la Letter card nella scatola.
  fragment no:
    set fede = $fede - 1
    > Restituisci la busta senza aprirla. L'uomo non si offende; anzi, sembra quasi soddisfatto, come chi ha vinto una piccola scommessa con se stesso. "Anche il rifiuto è una forma di attenzione", dice. "Ci rivedremo." Ti mette in mano qualche moneta "per il disturbo" e si allontana.

    > Il giorno dopo, al Cemetery, sulla tomba di tuo padre c'è un garofano nero. Il terriccio intorno alla lapide è smosso, come se qualcuno ci avesse appoggiato l'orecchio per ascoltare.
    block setupEvent next=$hub:
      ! Guadagni $3. Rimetti la Letter card nella scatola.

:: G1Fine
  # **La donna del carro**
  ! **Verbale del consiglio di {$townname} – *autunno 1856.***
  > Il consiglio si riunisce nella sala sopra la locanda, perché in municipio piove dentro. Siedono il Sindaco Bódi, il notaio, tre possidenti, il maestro di scuola e, su una sedia a parte, Padre Anzelm, che non ha diritto di voto ma ha diritto di parola, e lo esercita per un'ora e mezza.

  > La questione all'ordine del giorno è una sola: se la signora Eszter Vámos, di professione "consolatrice", possa restare a {$townname}. In otto anni il suo carro è diventato una casa con le persiane sempre chiuse; il suo salotto, ogni giovedì, si riempie di gente che entra piangendo ed esce sorridendo; e il Circolo dell'Ultima Ora, che nessuno ammette di frequentare, ha comprato due terreni accanto al cimitero.

  > Il parroco parla di eresia, di truffa, di lutti sfruttati. Il notaio parla di tasse regolarmente pagate. Il Sindaco non parla: ascolta, e conta. Alla fine si decide, com'è uso a {$townname} per le faccende spinose, di far votare anche le famiglie più importanti del villaggio. E la più importante, ormai, è quella degli eredi.
  if $lukacs == "amico":
    > A sorpresa prende la parola anche il nipote del medico, il giovane Lukács, tornato da Vienna con la laurea fresca: racconta di una busta sigillata, aperta e richiusa con il vapore, e chiede al consiglio un'ispezione del carro. Il consiglio ringrazia e non decide niente.
  if $bodi == "comprato":
    > Il Sindaco Bódi, contro ogni abitudine, prende la parola: parla della carità, del conforto ai vedovi, delle tasse pagate puntualmente dalla signora Vámos. Nessuno lo ha mai sentito parlare così a lungo.
  elif $bodi == "ricattato":
    > Il Sindaco Bódi parla poco e guarda spesso la famiglia della tenuta, come un cane guarda il padrone che lo ha appena battuto.
  elif $bodi == "chiesa":
    > Il Sindaco Bódi, a sorpresa, si schiera con il parroco, e cita perfino un versetto del Levitico, leggendolo da un foglietto.
  if $porta == "murata":
    > Il parroco, nel suo intervento, ringrazia "le famiglie generose che hanno contribuito ai lavori della sacrestia vecchia". Il muro, dice, tiene.
  if $allievo:
    > Si nota che uno degli eredi, il giovedì sera, entra nel carro della signora Vámos e ne esce a notte fonda. Nessuno lo dice a voce alta. Tutti lo scrivono nel verbale con gli occhi.

  [[Clicca per continuare... => G1FineVoto]]

:: G1FineVoto
  # **Resta o se ne va?**
  ui specialEvent
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: Madame Vámos resta nel villaggio.
  ! NAY: Madame Vámos viene cacciata.
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G1FineEsito" mode="Voting"

:: G1FineEsito
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Madame Vámos resta. (YAY) ~> resta]]
  [[Madame Vámos viene cacciata. (NAY) ~> via]]
  fragment resta:
    set madame = "ospite"
    set fede = $fede + 2
    goto G1Domande
  fragment via:
    set madame = "cacciata"
    set fede = $fede - 2
    goto G1Domande

:: G1Domande
  # **Prima del buio**
  if $madame == "ospite":
    > Madame Vámos resta. La sera stessa le finestre della sua casa si illuminano una a una, e dal salotto arriva il suono di un pianoforte che nessuno, a {$townname}, ha mai visto entrare. La settimana dopo il Circolo dell'Ultima Ora affitta una casa in piazza, proprio di fronte alla chiesa, e ci appende una targa d'ottone con un occhio aperto. Padre Anzelm fa suonare le campane a morto per un'ora, senza che sia morto nessuno.
  else:
    > Il carro, rimesso in ordine per l'occasione, lascia il villaggio all'alba. Madame Vámos siede a cassetta, dritta, senza guardarsi indietro; solo quando passa davanti al cancello della tenuta alza una mano bianca, come per salutare qualcuno alla finestra. Alla finestra non c'era nessuno.

    > La mattina dopo, sulla porta della tenuta, qualcuno ha disegnato con il carbone un occhio aperto. Il servitore lo lava tre volte. Alla terza l'occhio è ancora lì, appena più sbiadito, come se guardasse da sotto l'acqua.

  ! Quella sera, la famiglia:
  [[Va a salutare Madame Vámos. ~> saluta]]
  [[Resta alla finestra. ~> finestra]]
  fragment saluta:
    if $madame == "ospite":
      > Madame Vámos vi riceve nel salotto nuovo, ancora pieno di casse, con il pianoforte che suona da solo nella stanza accanto. Vi offre un liquore di prugne, vi ringrazia uno per uno, e a ognuno stringe la mano un attimo più del necessario. "Siamo vicini, adesso", dice. "Per sempre, se volete."
    else:
      > Raggiungete il carro all'alba, sulla strada maestra, prima che superi il ponte. Madame Vámos fa fermare i cavalli e vi ascolta, seduta a cassetta, senza scendere. Poi si sfila un anello d'argento e lo dà al più giovane di voi. "Non me ne vado lontano", dice. "Non si va mai lontano, da qui."
    ! Prima di azzerare i tracciati, lo Storybook ha bisogno di sapere come lascia questo mondo ognuno dei vostri scienziati.
    [[Clicca per continuare... => G1DomA]]
  fragment finestra:
    > Restate alla finestra della sala da pranzo, al buio, a guardare. Dal villaggio arrivano voci, una musica, un cane che abbaia; poi più niente. Nessuno di voi va a dormire prima delle tre. Quando finalmente salite le scale, i colpi alle pareti vi accompagnano, gradino per gradino, come un padrone di casa che accompagna gli ospiti alla loro camera.
    ! Prima di azzerare i tracciati, lo Storybook ha bisogno di sapere come lascia questo mondo ognuno dei vostri scienziati.
    [[Clicca per continuare... => G1DomA]]

::for L in A B C D | Chiusura
:: G1Dom%L%
  if %L.n% > $players:
    goto G1DomChiusura
  # **L'ultima pagina di {$name%L%}**
  prompt ins1%L% number: {$name%L%}, a che casella è il tuo segnalino {icon:Insanity_Icon}?
  prompt cuo1%L% number: {$name%L%}, quanti Charity token {icon:S1_HeartToken} hai?
  set conforto = $conforto + $cuo1%L%
  goto G1Dom%L.next%
::endfor

:: G1DomChiusura
  # **Fine della Generazione**
  ! **Nota del dott. Halász.**
  > I documenti della prima generazione si interrompono qui. Dai registri della parrocchia risulta che gli scienziati della famiglia morirono negli anni seguenti, uno dopo l'altro, di malattie diverse e in età diverse, e che furono sepolti nel cimitero di {$townname}, accanto al padre. Il parroco annota con una certa soddisfazione che i colpi alle pareti della tenuta cessarono con l'ultimo funerale.

  > Annota anche, con meno soddisfazione, che nessuno di quei funerali si poté celebrare dopo il tramonto: appena faceva buio, i portatori si rifiutavano di sollevare la bara. Dicevano che dentro qualcuno bussava.
  ui endOfGeneration generation=3 text: Rimuovete tutti i pezzi dal tabellone ed eseguite la Fine della Generazione. Rimettete nella riserva i token {icon:StorybookToken} non usati e i Charity token {icon:S1_HeartToken} dei giocatori.
  [[Clicca per continuare... => G2Intro]]
