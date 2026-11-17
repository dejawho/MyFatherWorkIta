// Il Velo Sottile – preparazione, prologo e pagine comuni.
// Design: docs/custom/the-thinning-veil/design.it.md.

::vars
round = 0
// L'hub del Round in corso: le pagine dei traguardi ci tornano.
hub = ""
caso = ""
tracker = 0
// Lo stato della storia (vedi il design, sezione 5).
velo = 0
fede = 0
madame = "ospite"
apparato = 0
contributi = 0
conforto = 0
fiala = ""
sindaco = ""
partecipanti = 0
parola = ""
// Quale delle versioni di un messaggio (Sedute degli Antenati).
voce = 1
// Dove continua la pagina ChiSei.
dopo = ""
winner = ""
chi = ""
scelta = ""
possesso = false
prove = 0
smascherate = 0
// Gli eventi nei Luoghi (una volta sola ciascuno) e le scelte che tornano più avanti.
evTubo = false
evFabbro = false
evCarro = false
evBanca = false
evVedova = false
evStagno = false
evSacrestia = false
evSindaco = false
evStudente = false
// Il tubo acustico sulla tomba del padre: "ascoltato", "sigillato", "lasciato".
tubo = ""
// Jóska, il figlio del fabbro (nato nel 1842): "amico", "offeso".
joska = ""
// Le lettere del padre nel baule di Madame.
lettere = false
// Le prove dei trucchi del Circolo, raccolte nelle tre Generazioni.
trucchi = 0
// Il conto del padre alla Bank: "preso", "restituito", "chiesto".
denaro = ""
// La vedova del mugnaio: "truffa", "madame", "verita".
mulino = ""
// Peti, il bambino dello stagno: "sepolto", "corpo", "vegliato".
peti = ""
// La porta della sacrestia vecchia: "murata", "aperta".
porta = ""
// Il Sindaco Bódi (e i suoi discendenti): "comprato", "ricattato", "chiesa".
bodi = ""
// Il giovane Lukács: "amico", "deriso".
lukacs = ""
// Seconda Generazione.
evMuri = false
evTubo2 = false
evFilo = false
evGioco = false
evFotografo = false
evChierichetto = false
evMulino = false
evFossa = false
evMedico = false
// La fotografia degli spiriti: "posa", "lastre", "trucco".
foto = ""
// Benedek, il chierichetto (poi Padre Benedek): "amico", "deluso".
benedek = ""
// Terza Generazione.
evArchivio = false
evConto = false
evMargini = false
evConfessione = false
evFosforo = false
evCorrente = false
evTomba = false
evInviti = false
evCampane = false
// Le carte di famiglia murate in sacrestia con quelle della parrocchia.
archivio = false
// I margini del libretto francese: il padre e il Circolo.
margini = false
// La confessione di Jóska, messa per iscritto.
confessione = false
// Quarto evento per Round.
evCodicillo = false
evTerreno = false
evLezione = false
evStagno2 = false
evCoprifuoco = false
evBecchini = false
evCilindro = false
evOfferta = false
evVigilia = false
// La camera del padre: "intatta", "svuotata".
camera = ""
// Il terreno accanto al cimitero: "venduto", "rifiutato", "chiesto".
terreno = ""
// Le lezioni di Madame Vámos a un erede.
allievo = false
// Quinto evento per Round.
evDagherrotipo = false
evChiavi = false
evPanchina = false
evFondamenta = false
evCasa = false
evMano = false
evCensimento = false
evStanze = false
evVisitatori = false
// Per le cronache: il nucleo di ferro nel muro, la bobina del telegrafo, la scatola del mugnaio.
nucleo = false
bobina = false
latta = false
// I traguardi degli Storybook token, uno per tipo e Generazione.
tkCreepy = false
tkInsanity = false
tkOccult = false
tkVP = false
// Per giocatore: la risposta ai colpi, il patto del Circolo e quello che lo Storybook chiede
// a fine Generazione (Insanity e cuori), per la Seduta degli Antenati.
::for L in A B C D
colpi%L% = ""
patto%L% = false
segreto%L% = false
ins1%L% = 0
cuo1%L% = 0
ins2%L% = 0
cuo2%L% = 0
::endfor

:: Preparativi [Begins-Here]
  # **Preparativi**
  ! Completate la preparazione standard per {$players} giocatori come indicato nel regolamento. *Nota: il tracciato {icon:AngryMob_Icon} e il Primo Giocatore verranno stabiliti dallo Storybook nelle prossime pagine.*

  ! {icon:ScenarioBox3D_Disease}
  ! Questo scenario non ufficiale usa alcuni componenti della Scatola dello Scenario **The Cost of Disease**. Tenetela a portata di mano, ma **non apritela**: lo Storybook vi dirà di volta in volta quali componenti prendere. Tutti gli altri devono restare nella scatola, nascosti.

  [[Clicca qui per continuare... => Prologo]]

// Pagina narrata (tag voice): niente nomi né varianti nel testo narrativo.
:: Prologo [voice]
  # **Il fascicolo Halász**
  ! **Dott. Ferenc Halász – Società per la Ricerca Psichica, Budapest – *3 marzo 1923.***

  > Egregi colleghi,
  > vi scrivo dal villaggio di cui vi avevo parlato, dove sono arrivato con il treno della sera e un ombrello che non è servito a nulla. Il parroco, un uomo gentile e molto stanco, mi ha consegnato le chiavi della sacrestia vecchia. Dietro un armadio di noce c'era una porta murata alla meglio; dietro la porta, sei casse di documenti.

  > Verbali di seduta, lettere mai spedite, pagine di diario strappate, ritagli della gazzetta locale, telegrammi con l'inchiostro ormai viola. Coprono cinquant'anni e tre generazioni della stessa famiglia: scienziati, o qualcosa che a loro piaceva chiamare così, che per mezzo secolo cercarono di parlare con i morti. E, a quanto pare, non sempre senza risposta.

  > Ho deciso di ordinarli e di trascriverli prima di formulare qualunque giudizio. Il primo documento è il verbale di una veglia funebre. Vi chiedo di leggerlo come l'ho letto io: con lo scetticismo che la Società esige, e con la finestra chiusa.

  > *Vostro devotissimo, F. Halász*
  [[Clicca per continuare... => G1Intro]]

// Sceglie un giocatore a caso: $caso. Il gioco è per 2–4 giocatori.
:: CasoGiocatore
  if $players == 2:
    set caso = either($nameA, $nameB)
  elif $players == 3:
    set caso = either($nameA, $nameB, $nameC)
  else:
    set caso = either($nameA, $nameB, $nameC, $nameD)

// All'inizio di ogni Generazione: Angry Mob, Suspicion Marker e Primo Giocatore.
:: PreparaFolla
  if $players == 2:
    set tracker = 6
  elif $players == 3:
    set tracker = either(6, 7)
  else:
    set tracker = either(7, 8, 9)
  include CasoGiocatore
  ! Mettete il Suspicion Marker sulla casella **{$tracker}** e il segnalino {icon:AngryMob_Icon} una casella a sinistra. Date il segnalino {icon:StartPlayerToken} a **{$caso}**.

// I traguardi degli Storybook token, uguali in ogni Generazione: le voci dell'hub.
:: Traguardi
  if !$tkCreepy:
    block hubTitle:
      ! {icon:StorybookToken} **Creepy 3**
    block hubDetails:
      ! La prima volta che un giocatore raggiunge la casella 3 del tracciato {icon:Creepy_Icon} in questa Generazione, [[clicca qui. -> TkCreepy]]
  if !$tkInsanity:
    block hubTitle:
      ! {icon:StorybookToken} **Insanity 3**
    block hubDetails:
      ! La prima volta che un giocatore raggiunge la casella 3 del tracciato {icon:Insanity_Icon} in questa Generazione, [[clicca qui. -> TkInsanity]]
  if !$tkOccult:
    block hubTitle:
      ! {icon:StorybookToken} **Journal Occult**
    block hubDetails:
      ! La prima volta che un giocatore raggiunge il Livello 2 del Journal Track Occult in questa Generazione, [[clicca qui. -> TkOccult]]
  if !$tkVP:
    block hubTitle:
      ! {icon:StorybookToken} **15VP**
    block hubDetails:
      ! La prima volta che un giocatore raggiunge 15VP in questa Generazione, [[clicca qui. -> TkVP]]

// Rimette i traguardi all'inizio di una Generazione.
:: AzzeraTraguardi
  set tkCreepy = false
  set tkInsanity = false
  set tkOccult = false
  set tkVP = false

:: PosaTraguardi
  set _SetupImage = "StorybookToken"
  ! **Prendete 4 token {icon:StorybookToken}.**
  ! Mettetene uno sulla **casella 3** del tracciato {icon:Creepy_Icon}, uno sulla **casella 3** del tracciato {icon:Insanity_Icon} e uno sulla **casella 15** del tracciato dei Punti Vittoria. Il quarto va in cima alla colonna del **Livello 2 del Journal Track Occult**: vale per tutti i giocatori.
  ! Quando il segnalino di un giocatore raggiunge uno di questi token, quel giocatore clicca sulla voce corrispondente nello Storybook e legge un messaggio. Poi il token torna nella riserva.

:: TkCreepy
  set tkCreepy = true
  # **Qualcuno ti guarda**
  if $round <= 3:
    > Da qualche giorno, quando attraversi {$townname}, la gente si fa il segno della croce. I bambini smettono di giocare, i cani abbassano la coda. Di notte, sotto la tua finestra, ci sono impronte di piedi nudi che arrivano fino al muro e poi non tornano indietro. Qualunque cosa sia, ha deciso che sei la persona più interessante del paese.

    > Una mattina, sulla soglia, trovi un regalo. È meglio non chiedersi da dove venga.
  elif $round <= 6:
    > Nella nebbia non sei mai senza compagnia. Ti segue un passo leggero, sempre a tre metri, che si ferma quando ti fermi. Le lanterne si piegano verso di te come fiori verso il sole, e il cane della tenuta non vuole più dormire nella tua stanza. In paese dicono che porti con te le Presenze, come altri si portano dietro un odore.

    > Una mattina, sulla soglia, trovi un regalo avvolto in un lenzuolo bagnato di nebbia. È meglio non chiedersi da dove venga.
  else:
    > La Gazzetta ha pubblicato la tua fotografia in un articolo sulle "famiglie che parlano con i morti", e da allora in città ti riconoscono tutti. Le signore attraversano la strada, i tranvieri non ti fanno pagare il biglietto, i bambini ti seguono a distanza cantando una filastrocca sul velo. Di notte, sotto la finestra, ci sono impronte di piedi nudi sul selciato bagnato.

    > Una mattina, sulla soglia, trovi un regalo, con un biglietto: *"Da parte di chi ti guarda."*
  ! Che cosa fai?
  [[Lo tieni, e lo porti in laboratorio. ~> tieni]]
  [[Lo porti al cimitero e lo seppellisci. ~> seppellisci]]
  fragment tieni:
    > In laboratorio, sotto la lampada, il regalo si rivela utile, e inquietante esattamente quanto ti aspettavi. Ringrazi a voce alta, per educazione. Qualcuno, dietro la porta, sembra soddisfatto.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Bodies_Icon}. Rimetti il token {icon:StorybookToken} nella riserva.
  fragment seppellisci:
    set velo = $velo - 1
    > Lo seppellisci in un angolo del cimitero, di notte, con una preghiera che ricordi a metà. La mattina dopo le impronte sotto la tua finestra non ci sono più. Al loro posto, sul davanzale, c'è un sasso bianco, liscio, come quelli che i bambini lasciano sulle tombe.
    block setupEvent next=$hub:
      ! Guadagni 1VP. Rimetti il token {icon:StorybookToken} nella riserva.

:: TkInsanity
  set tkInsanity = true
  # **Le voci**
  if $round <= 3:
    > All'inizio è solo un brusio, come una stanza piena di gente nella casa accanto. Poi distingui le parole. Poi le voci: una vecchia che cerca un anello, un bambino che conta fino a cento e ricomincia, un uomo che ripete sempre lo stesso indirizzo. Nessuno di loro sembra sapere di essere morto.
  elif $round <= 6:
    > Le voci arrivano con la nebbia, e con la nebbia non se ne vanno. Parlano in tedesco, in ungherese, in una lingua di campagna che nessuno usa più. Una donna ti chiede ogni sera se hai visto suo figlio; un soldato ti chiede la strada per un villaggio bruciato quarant'anni fa. Alcune voci le riconosci: le hai sentite a tavola, nell'infanzia, quando gli adulti credevano che dormissi.
  else:
    > Le senti nel ronzio dei fili della luce, nel fischio del treno, nella puntina del fonografo del caffè quando il disco è finito e gira a vuoto. Centinaia di voci, migliaia, educate e pazienti come una folla in una sala d'attesa. Ognuna aspetta il suo turno per dirti qualcosa. Qualcuna, ti sembra, ha aspettato cinquant'anni.
  ! Che cosa fai?
  [[Prendi appunti. ~> appunti]]
  [[Ti tappi le orecchie con la cera. ~> cera]]
  fragment appunti:
    set velo = $velo + 1
    > Prendi appunti. Non sapresti dire se lo fai per la scienza o per farli tacere.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge). Rimetti il token {icon:StorybookToken} nella riserva.
  fragment cera:
    > Scaldi la cera di una candela tra le dita e te ne riempi le orecchie, come i marinai della storia. Il silenzio è così improvviso che ti gira la testa. Per tre giorni non senti niente: né le voci, né la pioggia, né chi ti parla a tavola. Il quarto giorno togli la cera, e le voci non ci sono più. Per ora.
    block setupEvent next=$hub:
      ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon}. Rimetti il token {icon:StorybookToken} nella riserva.

:: TkOccult
  set tkOccult = true
  # **Il libro dei morti**
  if $round <= 3:
    > Una mattina apri il diario e trovi una pagina che non hai scritto. La calligrafia è inclinata all'indietro, l'inchiostro è ancora fresco, e la formula che descrive è sbagliata in un punto solo, come se chi l'ha scritta volesse vedere se te ne accorgi.
  elif $round <= 6:
    > Il secondo volume del diario ha una pagina in più. Ieri non c'era: lo sai perché le hai contate, tutte, la sera prima. È scritta con due calligrafie, quella del nonno e quella di chi ti ha messo al mondo, che si alternano riga per riga come in una conversazione. La formula in fondo è sbagliata in un punto solo.
  else:
    > Tra le pagine del diario, che ormai sono tre volumi e mezzo, c'è un foglio battuto con i tasti d'osso del Telegrafo: lo riconosci dalle lettere un poco storte. Nessuno ha acceso la macchina. Il foglio descrive un esperimento, con cura e impazienza, ed è sbagliato in un punto solo.
  ! Che cosa fai?
  [[Correggi l'errore sulla pagina. ~> correggi]]
  [[Strappi la pagina e la bruci. ~> strappa]]
  fragment correggi:
    set velo = $velo + 1
    > Te ne accorgi. Sotto la correzione, qualcuno ha aggiunto una parola sola: *"Bene."*
    block setupEvent next=$hub:
      ! Pesca un Esperimento dal mazzo che preferisci. Rimetti il token {icon:StorybookToken} nella riserva.
  fragment strappa:
    > La pagina brucia male, a scatti, come carta umida. Quando è cenere, nel diario, al suo posto, è rimasto un margine strappato con tre parole scritte di traverso: *"Peccato. Un'altra volta."* Ma la formula, quella giusta, ormai l'hai capita da te.
    block setupEvent next=$hub:
      ! Guadagni 2VP. Rimetti il token {icon:StorybookToken} nella riserva.

:: TkVP
  set tkVP = true
  # **Il nome sulla bocca di tutti**
  if $round <= 3:
    > Il tuo nome gira per {$townname}: al mercato, in chiesa, nelle osterie. Alcuni lo dicono con paura, altri con ammirazione, tutti a bassa voce. Pochi giorni dopo un biglietto listato a lutto ti invita "a una cena tra persone che non si rassegnano"; dentro la busta, a titolo di cortesia, c'è del denaro.
  elif $round <= 6:
    > Le signore del Circolo ti salutano per nome, i notabili ti offrono il loro posto al caffè, il medico condotto scrive di te a un collega di Vienna. Pochi giorni dopo arriva un biglietto listato a lutto: un invito "a una cena tra persone che non si rassegnano, nella nebbia, come ai vecchi tempi"; dentro la busta, a titolo di cortesia, c'è del denaro.
  else:
    > Il giornale di Budapest ti dedica un trafiletto, con un disegno a penna non troppo somigliante. In città ti chiedono autografi, consigli, raccomandazioni presso i morti. Pochi giorni dopo arriva un biglietto listato a lutto: un invito "a una cena tra persone che non si rassegnano, come la tua famiglia da tre generazioni"; dentro la busta, a titolo di cortesia, c'è del denaro.
  > Il sigillo di ceralacca è nero, con un occhio aperto.
  ! Che cosa fai?
  [[Vai alla cena. ~> cena]]
  [[Rimandi indietro l'invito, e il denaro. ~> rifiuta]]
  fragment cena:
    set fede = $fede + 1
    > La cena è in una casa con le persiane chiuse, a lume di candela. Gli ospiti sono gentili, ben vestiti, e non mangiano niente. Nessuno ti chiede di firmare nulla; ti chiedono soltanto della tua famiglia, con un interesse affettuoso, come si chiede di parenti lontani. Al momento di andare ti accorgi che ogni ospite ha accanto a sé un posto apparecchiato e vuoto.
    block setupEvent next=$hub:
      ! Guadagni $2. Rimetti il token {icon:StorybookToken} nella riserva.
  fragment rifiuta:
    set fede = $fede - 1
    > Rimandi la busta al mittente, senza un biglietto, con il sigillo intatto. Il giorno dopo te la riportano, intatta anche lei, con una sola riga sul retro: *"Il posto resta apparecchiato."* In paese si sparge la voce che hai detto di no al Circolo; qualcuno ti stringe la mano per strada.
    block setupEvent next=$hub:
      ! Guadagni 1VP. Rimetti il token {icon:StorybookToken} nella riserva.

// Chi gioca la pagina: per le lettere e le sedute private. Imposta $chi e continua con $dopo.
:: ChiSei
  ! Chi sta leggendo?
  [[{$nameA} ~> a]]
  [[{$nameB} ~> b]]
  if $players > 2:
    [[{$nameC} ~> c]]
  if $players > 3:
    [[{$nameD} ~> d]]
  fragment a:
    set chi = "A"
    goto $dopo
  fragment b:
    set chi = "B"
    goto $dopo
  fragment c:
    set chi = "C"
    goto $dopo
  fragment d:
    set chi = "D"
    goto $dopo
