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
  > Da qualche giorno, quando attraversi {$townname}, la gente si fa il segno della croce. I bambini smettono di giocare, i cani abbassano la coda. Di notte, sotto la tua finestra, ci sono impronte di piedi nudi che arrivano fino al muro e poi non tornano indietro. Qualunque cosa sia, ha deciso che sei la persona più interessante del paese.

  > Una mattina, sulla soglia, trovi un regalo. È meglio non chiedersi da dove venga.
  ! Guadagni 1 {icon:Bodies_Icon}. Rimetti il token {icon:StorybookToken} nella riserva.
  [[Torna al Round => $hub]]

:: TkInsanity
  set tkInsanity = true
  set velo = $velo + 1
  # **Le voci**
  > All'inizio è solo un brusio, come una stanza piena di gente nella casa accanto. Poi distingui le parole. Poi le voci: una vecchia che cerca un anello, un bambino che conta fino a cento e ricomincia, un uomo che ripete sempre lo stesso indirizzo. Nessuno di loro sembra sapere di essere morto.

  > Prendi appunti. Non sapresti dire se lo fai per la scienza o per farli tacere.
  ! Guadagni 1 Conoscenza Occulta (Occult Knowledge). Rimetti il token {icon:StorybookToken} nella riserva.
  [[Torna al Round => $hub]]

:: TkOccult
  set tkOccult = true
  set velo = $velo + 1
  # **Il libro dei morti**
  > Una mattina apri il Journal e trovi una pagina che non hai scritto. La calligrafia è inclinata all'indietro, l'inchiostro è ancora fresco, e la formula che descrive è sbagliata in un punto solo, come se chi l'ha scritta volesse vedere se te ne accorgi.

  > Te ne accorgi. Sotto la correzione, qualcuno ha aggiunto una parola sola: *"Bene."*
  ! Pesca un Esperimento dal mazzo che preferisci. Rimetti il token {icon:StorybookToken} nella riserva.
  [[Torna al Round => $hub]]

:: TkVP
  set tkVP = true
  set fede = $fede + 1
  # **Il nome sulla bocca di tutti**
  > Il tuo nome gira per {$townname}: al mercato, in chiesa, nelle osterie. Alcuni lo dicono con paura, altri con ammirazione, tutti a bassa voce. Pochi giorni dopo un biglietto listato a lutto ti invita "a una cena tra persone che non si rassegnano"; dentro la busta, a titolo di cortesia, c'è del denaro.

  > Il sigillo di ceralacca è nero, con un occhio aperto.
  ! Guadagni $2. Rimetti il token {icon:StorybookToken} nella riserva.
  [[Torna al Round => $hub]]

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
