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

:: G1Lettere
  # **Lettere senza firma**
  > Negli anni della maturità la famiglia comincia a ricevere posta che il postino non ha mai consegnato. Le lettere compaiono sotto la porta, nel cestino del pane, una volta perfino dentro il Journal del padre, chiuso a chiave nello scrittoio. Sono buste di carta pesante, senza indirizzo e senza firma, sigillate con ceralacca nera; nella ceralacca, un occhio aperto.

  > Dentro, ogni volta, poche righe in una calligrafia elegante e antiquata. Il **Circolo dell'Ultima Ora** saluta gli eredi del grande scienziato, conosce i loro lavori, ammira il loro coraggio e desidera incontrarli, uno per uno, in un luogo discreto. Basterà presentarsi all'indirizzo indicato e pronunciare la parola giusta.
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
