// Seconda Generazione – "Il paese perfetto" (1891–1915).
// Pagine della Chronicle: ATOW 17 (Giovinezza), ATOW 21 (Maturità), ATOW 8 (Vecchiaia).
// Testo italiano completo, rivisto per coerenza.

:: VSG2Intro [INTRO voice]
  # **GENERAZIONE II: Il paese perfetto**
  ! **Registro Maas – dottor Joost Maas, medico condotto, *gennaio 1891.***
  > Riprendo il Registro di mia madre, per rispetto e per abitudine, e con un proposito: ci scriverò soltanto quello che si può misurare. Mia madre era una donna intelligente e una levatrice eccellente, ma negli ultimi anni contava le mani fredde come altri contano i rosari. Io ho studiato in città. Le mani fredde, in medicina, si chiamano cattiva circolazione.

  > Il paese non è più quello in cui sono nato. Le case di legno sono state rifatte in muratura, con le travi a vista e i tetti di tegole; l'argine è stato alzato, il mulino rifatto, la chiesa allargata. Il consiglio ha premiato il paese tre anni di fila come il più ordinato della provincia. Non ci sono furti, non ci sono debiti, non ci sono risse all'osteria, perché all'osteria non ci va più nessuno. Il coro della chiesa è il migliore della diocesi.

  > Qualche famiglia, negli anni, se n'è andata: i Mulder, i De Graaf, la vedova Brink, una dozzina in tutto. Dicevano che qui non si trovavano più bene. Le loro case sono rimaste vuote, e nessuno le compra; i tetti cedono, le finestre si rompono, l'erba cresce sulle soglie. In un paese così ordinato, quelle rovine stonano. Il sindaco ha promesso di farle abbattere.

  > Alla tenuta vivono ora i nipoti del vecchio. La torre è aperta, la Macchina è ancora lì, sotto un telo, e nessuno sa farla funzionare.
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G2SognoA:
      include AzzeraTraguardi
      include PosaTraguardi

:: G2Inizio
  # **Le case vuote**
  > La prima settimana dell'anno arriva alla tenuta un signore del consiglio, giovane, con la barba ben curata e le mani in tasca: è Bram Wessel, il figlio del sindaco. Porta una proposta. Le case delle famiglie partite sono in vendita, a un prezzo ridicolo, e il consiglio preferirebbe che le comprasse la tenuta, "gente di qui", piuttosto che qualche forestiero. Il consiglio, aggiunge, aiuterebbe volentieri a sistemarle.
  if $wessel == "moglie":
    > Mentre parla, chiedi notizie di sua madre, la signora Wessel, partita per la città tanti anni fa. Bram sorride: è ancora dalla sorella, sta benissimo, scrive ogni settimana. Non è mai tornata. Lui non sembra trovarlo strano.
  ! Che cosa fate? *(Decidete insieme.)*
  [[Comprate le case. ~> compra]]
  [[Cercate le famiglie partite, prima. ~> cerca]]
  fragment compra:
    set fiducia = $fiducia + 1
    > Firmate, pagate pochissimo, e la settimana dopo una squadra di operai del paese è già al lavoro: tetti nuovi, finestre nuove, intonaco bianco. Lavorano senza paga, sorridendo. Quando chiedete perché, rispondono che è un piacere aiutare i vicini.
    block setupEvent next=G2R1:
      ! Ogni giocatore guadagna $2.
  fragment cerca:
    set ronda = $ronda + 1
    > Scrivete a tutte le famiglie partite, agli indirizzi lasciati in comune. Arrivano tre risposte. I Mulder sono a Rotterdam, poveri e contenti; i De Graaf in America. La terza è di un'affittacamere della città: la vedova Brink è morta, da sola. Nessuno vuole tornare. L'ultima lettera, quella dei Mulder, finisce così: *Là si sta troppo bene. Noi preferiamo stare male.*
    block setupEvent next=G2R1:
      ! Ogni giocatore guadagna 1 Prova {icon:S3_WeaponToken}.

:: G2R1 [HUB]
  # **I VICINI SILENZIOSI – Giovinezza**
  set round = 4
  if $hub != "G2R1":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Aprite la Village Chronicle alla sezione **A Time of War** ({icon:S3_ScenarioIcon}) e andate a **pagina 17**.
      include PreparaFolla
      set luogo = "Builder's Office"
      include PosaVicino
      ! *È il capomastro Lambert: non sbaglia mai una misura.*
      set pozzi = $pozzi + 1
      set _SetupImage = "S3_ParadoxToken"
      ! Mettete un token {icon:S3_ParadoxToken} sul **Park**.
      if $pietra == "torbiera":
        ! La pietra {icon:S3_CrownToken} resta sul **Park**: è nella torbiera.
  set hub = "G2R1"
  include VociComuni
  include VociRonda
  if !$evScuola:
    block hubTitle:
      ! {icon:Storybook} **I disegni dei bambini – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G2Scuola]]
  if !$evRonda:
    block hubTitle:
      ! {icon:Storybook} **La Ronda – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G2RondaChi]]
  if !$evVanga:
    block hubTitle:
      ! {icon:Storybook} **La vanga di Gerrit – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G2VangaChi]]
  if !$evRovine:
    block hubTitle:
      ! {icon:Storybook} **Le case in rovina – Builder's Office**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Builder's Office [[clicca qui. -> G2Rovine]]
  if !$evPiet:
    block hubTitle:
      ! {icon:Storybook} **Il segretario – Laborer's Union**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Laborer's Union [[clicca qui. -> G2Piet]]
  if !$evGhiaccio:
    block hubTitle:
      ! {icon:Storybook} **Il ghiaccio dello stagno – Park**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Park [[clicca qui. -> G2Ghiaccio]]
  if !$evMulder:
    block hubTitle:
      ! {icon:Storybook} **Il carro dei Mulder – Traveling Caravan**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Traveling Caravan [[clicca qui. -> G2Mulder]]
  block hubTitle:
    ! **Evento del primo Round**
  block hubDetails:
    > Il paese è in festa per il premio della provincia: bandierine, una banda, il discorso del sindaco sul palco davanti al Town Hall. Il sindaco Aldert Wessel ha settant'anni e ne dimostra cinquanta. Parla per un'ora senza mai guardare il foglio, e alla fine tutti applaudono nello stesso momento, e smettono nello stesso momento.
    if $lambert:
      > Dalla piazza si vede la torre della tenuta, con le catene di ferro che il capomastro Lambert le mise intorno qualche anno fa. Non si è mossa di un dito. I bambini la chiamano "la torre in prigione".
    if $pietra == "torbiera":
      > Nel punto della luce, nella torbiera, dove la pietra dorme, il ghiaccio non si forma mai. I pattinatori, d'inverno, ci girano intorno senza guardare.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    include SetePietra
    ui endOfRound progress="G2R1" next="G2Cronaca"

::round G2R1 4
fine: La Giovinezza della Seconda Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Maturità prima di continuare.

// La Ronda: chi la guida può togliere un Vicino senza Prove, una volta per Generazione.
:: VociRonda
  if $scudo != "" && !$scudoUsato && $figure > 0:
    block hubTitle:
      ! {icon:S3_ShieldToken} **La Ronda**
    block hubDetails:
      ! Una volta in questa Generazione, chi ha lo Shield token {icon:S3_ShieldToken} (**{$scudo}**) può togliere un Vicino {icon:S3_WoodenFigureToken} dal tabellone senza spendere Prove: [[clicca qui. -> RondaNotte]]

:: RondaNotte
  set scudoUsato = true
  set figure = $figure - 1
  set vicini = $vicini - 1
  set fiducia = $fiducia - 1
  # **La Ronda**
  if $round <= 6:
    > Escono a mezzanotte, in sei, con le lanterne e i bastoni, e bussano a una porta sola. Il Vicino apre in camicia da notte, sveglio, come se li aspettasse. Non oppone resistenza. Lo portano all'argine, lo fanno sedere sulla riva, e aspettano l'alba con lui, in silenzio. All'alba, al suo posto, c'è un mucchio di torba bagnata.
  else:
    > Escono a mezzanotte, con le lanterne elettriche e un fucile da caccia, e bussano a una porta sola. Hendrik Tammer, che ha fatto la guerra, entra per primo. Il Vicino è seduto al tavolo di cucina, vestito, con le mani in grembo. Dice soltanto: "Fate piano, i bambini dormono." Al mattino, sulla sedia, c'è un mucchio di torba.
  ! *La casa resta vuota. Il paese non chiede niente.*
  block setupEvent next=$hub:
    ! Rimettete nella riserva un Vicino {icon:S3_WoodenFigureToken} a scelta di {$scudo}. {$scudo} guadagna 1VP e 1 {icon:Creepy_Icon}.

:: G2Scuola
  set evScuola = true
  # **I disegni dei bambini**
  > La scuola di {$townname} si fa nella sala dietro la chiesa. La maestra Neeltje Borg, una ragazza della città con gli occhiali e la voce sottile, ti ferma all'uscita con una cartella sotto il braccio. Ogni lunedì, dice, chiede ai bambini di disegnare il sogno della domenica notte. È un esercizio che le hanno insegnato alla scuola normale. Qui, a {$townname}, metà dei bambini consegna il foglio bianco. Non sognano, dicono. L'altra metà disegna sempre la stessa cosa: la torbiera, di notte, con una luce in mezzo.
  ! Che cosa fai?
  [[Porti i disegni al dottor Maas. ~> dottore]]
  [[Dici alla maestra che è normale, a quell'età. ~> normale]]
  [[Le chiedi quali bambini consegnano il foglio bianco. ~> bianchi]]
  fragment dottore:
    set joost = $joost + 1
    > Joost Maas sfoglia i disegni nel suo studio, uno per uno, in silenzio. Poi li mette in ordine, dal più vecchio al più recente, e ti fa vedere una cosa che non avevi notato: in ogni disegno, settimana dopo settimana, la luce in mezzo alla torbiera è un po' più grande. Joost chiude la cartella e dice che è suggestione collettiva. Le mani gli tremano.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Insanity_Icon}.
  fragment normale:
    set fiducia = $fiducia + 1
    > La maestra ti ringrazia, sollevata: aveva paura di essere lei la strana. Ti confessa che, da quando è arrivata a {$townname}, è l'unica in paese che sogna ancora tutte le notti. Sogni brutti, dice, ma suoi.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment bianchi:
    > La maestra ti mostra il registro di classe, con una crocetta accanto ai nomi. I bambini dei fogli bianchi sono i più bravi della classe: puntuali, ordinati, educati. Non litigano, non piangono, non si sbucciano mai le ginocchia. Accanto ad alcuni nomi c'è una seconda crocetta, più piccola: i genitori, dice la maestra, hanno firmato le pagelle con la stessa calligrafia del bambino.
    block setupEvent next=$hub:
      ! Guadagni 2 Prove {icon:S3_WeaponToken}.

:: G2RondaChi
  set dopo = "G2Ronda"
  goto ChiSei

:: G2Ronda
  set evRonda = true
  # **La Ronda**
  > Al Town Hall, nella sala piccola, si sono riuniti una decina di cittadini: torbai, due commesse, il becchino Siebe, ormai vecchio, la maestra Borg. Vogliono fare la ronda di notte, come faceva una volta il pastore Kalf. Hanno visto cose, dicono: gente che cammina verso la torbiera in camicia da notte, a piedi nudi, e torna all'alba asciutta. Il consiglio ha già detto di no: a {$townname} non c'è criminalità, e una ronda spaventerebbe le famiglie. Serve qualcuno della tenuta, dicono, perché il consiglio non osi opporsi.
  if $ronda >= 3:
    > Sul tavolo c'è la vecchia lanterna della prima ronda, quella del pastore. Qualcuno l'ha conservata.
  ! Che cosa fai?
  [[Guidi la Ronda. ~> guida]]
  [[Li convinci a lasciar perdere. ~> lascia]]
  fragment guida:
    set scudo = $nomeChi
    set ronda = $ronda + 1
    set fiducia = $fiducia - 1
    set _SetupImage = "S3_ShieldToken"
    > Accetti. Ti consegnano la lanterna più grande, un fischietto e l'elenco dei turni. La prima notte non succede niente. La seconda, all'una, sulla strada dell'argine, incrociate un uomo in camicia da notte che cammina verso la torbiera con gli occhi aperti. Lo chiami per nome. Lui si ferma, si volta, ti saluta, e torna a casa.
    block setupEvent next=$hub:
      ! Prendi lo **Shield token** {icon:S3_ShieldToken} dalla Scatola di **A Time of War** e tienilo davanti a te: guidi la Ronda.
  fragment lascia:
    set fiducia = $fiducia + 1
    > Parli a lungo, con calma, e alla fine li convinci: una ronda dividerebbe il paese, e il paese è tutto quello che hanno. Se ne vanno a uno a uno, delusi. La maestra Borg è l'ultima. Sulla porta ti chiede se anche tu, la notte, sogni ancora.
    block setupEvent next=$hub:
      ! Guadagni $2.

:: G2VangaChi
  set dopo = "G2Vanga"
  goto ChiSei

:: G2Vanga
  set evVanga = true
  # **La vanga di Gerrit**
  > Al cimitero sull'argine, seduto su una tomba, c'è Gerrit Tammer, il figlio di Fokke, un uomo di trentacinque anni con le spalle larghe e la faccia di chi non dorme. Fa il torbaio come il padre, ma da solo, con la vanga vecchia, quella di prima. Viene qui ogni domenica, dice, sulla tomba di sua madre, morta l'anno scorso. Era l'unica che lo capiva.

  > "Mio padre non è mio padre", dice. "Lo so da quando avevo dieci anni. Mi ha cresciuto, mi ha voluto bene, non mi ha mai alzato le mani. Il mio vero padre me le alzava. Era un ubriacone e un violento. Ma era mio padre." Ti porge la vanga, con il manico consumato dalle mani di due generazioni di Tammer. "Qualcuno deve scavare. Io da solo non ce la faccio."
  ! Che cosa fai?
  [[Prendi la vanga. ~> prendi]]
  [[Gli dici di lasciar stare i morti. ~> lascia]]
  fragment prendi:
    set vanga = $nomeChi
    set _SetupImage = "S3_SickleToken"
    > Prendi la vanga. Gerrit ti stringe la mano, a lungo, con la sua mano calda e ruvida. "Scaveremo insieme", dice. "Nel punto della luce. Quando la torba è secca, a fine estate. Gli altri torbai non ci vanno: dicono che là sotto la torba è tiepida."
    block setupEvent next=$hub:
      ! Prendi il **Sickle token** {icon:S3_SickleToken} dalla Scatola di **A Time of War**: è la vanga del torbaio. Prendi anche la Compulsion **"Swing wide the iron gate!…"** messa da parte. Quando un tuo pezzo visita il Park, guadagni anche 1 {icon:Bodies_Icon}.
  fragment lascia:
    set fiducia = $fiducia + 1
    > Gerrit ascolta, annuisce, e si rimette la vanga in spalla. Non sembra offeso: sembra stanco. Se ne va per l'argine, verso la torbiera, da solo. La domenica dopo non viene al cimitero. Neanche quella dopo.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G2Rovine
  set evRovine = true
  # **Le case in rovina**
  > Al Builder's Office il capomastro Lambert, che ha passato da un pezzo l'età della pensione e sale ancora sui tetti, ha ricevuto dal consiglio l'ordine di abbattere le case vuote delle famiglie partite. I suoi muratori, però, non vogliono entrarci. Non sono i muri pericolanti, dicono: è che dentro c'è qualcuno. Nei letti, sotto le coperte ammuffite, c'è sempre una forma, come di una persona che dorme. Quando la scopri, è torba.
  ! Che cosa fai?
  [[Entri nella casa dei Mulder. ~> entra]]
  [[Paghi i muratori perché le abbattano subito ($2). ~> abbatti]]
  fragment entra:
    > La casa dei Mulder è fredda e buia. Nella camera da letto, sotto la coperta, c'è una forma lunga e magra, con la testa sul cuscino. Alzi la coperta: torba nera, umida, modellata come un uomo che dorme, con le mani giunte sul petto. Sul comodino c'è un paio di occhiali. Quelli del vecchio Mulder, che a Rotterdam, dicono, porta ancora.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.
  fragment abbatti:
    set vicini = $vicini - 1
    > Paghi il doppio, e i muratori lavorano in fretta, senza entrare: corde, cavalli, e i muri vengono giù tutti insieme in una nuvola di polvere nera. Lambert guarda la scena con le mani dietro la schiena, senza un'espressione. Dalle macerie, per tutto il giorno, sale un odore di torbiera.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 1VP.

:: G2Piet
  set evPiet = true
  # **Il segretario**
  > Al Laborer's Union, che ormai è un ufficio pulito con le pareti bianche e un ritratto della regina, il segretario del consiglio assume i braccianti per le opere pubbliche. È Piet Brink, il figlio della vedova: un giovane uomo di venticinque anni, ordinato, cortese, con una memoria prodigiosa. Conosce il nome di ogni bracciante, di ogni moglie, di ogni figlio. Non ha mai preso un giorno di malattia.
  if $piet == "torbiera":
    > Quando ti vede, riconosce subito la tua famiglia. "Uno dei vostri c'era", dice, gentile, "quel giorno alla torbiera, con mia madre. Lei mi chiamava. Io l'ho sentita, sapete. Ma dormivo troppo bene per rispondere."
  elif $piet == "visitato":
    > Quando ti vede, riconosce subito la tua famiglia. "La levatrice Maas mi visitò, quando ero ragazzo, perché glielo chiese uno dei vostri", dice, gentile. "Scrisse una frase sul suo Registro. Mi sono sempre chiesto quale."
  else:
    > Quando ti vede, riconosce subito la tua famiglia, e ti ringrazia: "Uno dei vostri disse a mia madre che ero cresciuto. Aveva ragione. Lei non ci credette mai, povera donna. È morta in città, sola. Io le scrivevo ogni settimana."
  ! Che cosa fai?
  [[Gli chiedi di sua madre. ~> madre]]
  [[Gli chiedi un lavoro per i braccianti della Ronda. ~> lavoro]]
  fragment madre:
    > Piet parla della vedova Brink con affetto, a lungo, senza un'esitazione. Ricorda tutto: le sue ricette, le sue canzoni, le sue sfuriate, il giorno in cui gli tirò dietro uno zoccolo. Ricorda tutto, tranne una cosa: non sa dire che cosa provava quando lei è partita. Ci pensa, sinceramente, con la fronte aggrottata. Poi sorride: "Niente di brutto, credo."
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Insanity_Icon}.
  fragment lavoro:
    set fiducia = $fiducia + 1
    > Piet li assume tutti, subito, con la paga piena. Non chiede niente in cambio. Il giorno dopo i braccianti della Ronda lavorano all'argine, insieme agli altri, e la sera tornano a casa stanchi, e la notte dormono.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Bodies_Icon}.

:: G2Mulder
  set evMulder = true
  # **Il carro dei Mulder**
  > Alla Traveling Caravan, tra i carri dei venditori, c'è un carro coperto con una famiglia intera seduta sopra, in silenzio: i Mulder, tornati da Rotterdam per una settimana, a recuperare le loro cose dalla casa vuota. Il vecchio Mulder ha le mani rovinate dal lavoro al porto e gli occhiali rotti, tenuti insieme con il filo. Quando ti vede scende dal carro e ti prende da parte, lontano dagli altri.

  > "Non bevete l'acqua", dice. "E se vedete qualcuno con la vostra faccia, non guardatelo negli occhi. Noi siamo partiti quando mia moglie mi ha detto buonanotte con la voce di sempre e le mani fredde. Quella sera ho preso i bambini e sono andato via. Lei non ci ha seguiti. Ci scrive. Dice che sta bene."
  ! Che cosa fai?
  [[Gli offri ospitalità alla tenuta ($1). ~> ospita]]
  [[Gli chiedi della moglie. ~> moglie]]
  fragment ospita:
    set ronda = $ronda + 1
    > I Mulder dormono alla tenuta per una settimana. Bevono solo birra. Il vecchio Mulder passa le sere con voi, davanti al camino, e racconta come era {$townname} prima delle due luci: sporca, povera, rissosa, piena di gente che litigava e cantava. Quando riparte, ti lascia una lista di nomi: quelli che, secondo lui, sono ancora "veri".
    block setupEvent next=$hub:
      ! Paga $1 e guadagni 2 Prove {icon:S3_WeaponToken}.
  fragment moglie:
    > La signora Mulder, ti dice il vecchio, vive ancora nella casa vuota. Non ne è mai uscita. Lui non ci è entrato, in questi giorni: manda i figli a prendere le cose. Stanotte, però, ci entrerà. Per salutarla. Il giorno dopo il carro dei Mulder riparte all'alba. Sul sedile accanto al vecchio c'è una donna con lo scialle, le mani in grembo, che sorride a tutti.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon} e 1 Conoscenza Occulta (Occult Knowledge).

:: G2Cronaca
  # **Una pagina del Registro**
  ! **Registro Maas – Joost Maas, *1897.***
  > Ho misurato la temperatura di centosessanta abitanti di {$townname}, in sei anni, con un termometro di precisione fatto venire da Leida. Centoventi hanno una temperatura media di trentaquattro gradi e otto decimi. Secondo i miei libri, a trentaquattro e otto un uomo trema, delira e muore. Questi centoventi stanno benissimo. Non tremano. Non si ammalano. Non vengono mai da me, se non per accompagnare qualcuno che ha la febbre.

  > Ho cominciato a pensare che mia madre avesse ragione. Non lo scrivo per intero: lo scrivo e basta.
  if $hester:
    > Nel cassetto del Registro, sotto l'orologio rotto che lei teneva lì, ho trovato le sue note sciolte: nomi, date, temperature, e accanto ad alcuni nomi una crocetta. Ho controllato le crocette una per una. Erano tutte giuste.
  if $scudo != "":
    > La Ronda di {$scudo} gira di notte, con le lanterne. Il consiglio protesta, con molta educazione. In paese, di giorno, salutano {$scudo} con la stessa cortesia di sempre. Di notte, quando la Ronda passa, le finestre restano buie.
  if $vanga != "":
    > {$vanga} scava con Gerrit Tammer, nel punto della luce, ogni fine estate. Dicono che la torba, là sotto, sia tiepida, e che a volte, se si accosta l'orecchio, si senta respirare. Dicono.
  if $scheggia:
    > Dalla città mi scrive un collega del museo di scienze naturali: il professore Ostrander è morto, a novant'anni passati, senza una malattia, sorridendo. Nel suo studio hanno trovato una scatolina di velluto immersa in un bicchiere d'acqua, e sulla poltrona un po' di torba.
  if $cane == "preso":
    > I nipoti del cane di Fokke Tammer, quello che la tenuta prese tanti anni fa, abbaiano ancora alle stesse persone. Li ho presi in prestito per il giro delle visite. Non sbagliano mai.
  [[Continua... => G2R2]]

:: G2R2 [HUB]
  # **I VICINI SILENZIOSI – Maturità**
  set round = 5
  if $hub != "G2R2":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Girate la Village Chronicle a **pagina 21**.
      set luogo = "Blacksmith"
      include PosaVicino
      ! *È Jaap Mol, il fabbro: ha settant'anni e batte il ferro come a trenta.*
      set pozzi = $pozzi + 1
      set _SetupImage = "S3_ParadoxToken"
      ! Mettete un token {icon:S3_ParadoxToken} sul **Farmer's Market**.
  set hub = "G2R2"
  include VociComuni
  include VociRonda
  if !$evCoro:
    block hubTitle:
      ! {icon:Storybook} **Il coro – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G2Coro]]
  if !$evFurto:
    block hubTitle:
      ! {icon:Storybook} **La pietra, di notte – Park**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Park [[clicca qui. -> G2FurtoChi]]
  if !$evRespiro:
    block hubTitle:
      ! {icon:Storybook} **Un respiro – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G2Respiro]]
  if !$evBanco:
    block hubTitle:
      ! {icon:Storybook} **Il banco di Fokke – Farmer's Market**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Farmer's Market [[clicca qui. -> G2Banco]]
  if !$evApprendista2:
    block hubTitle:
      ! {icon:Storybook} **L'apprendista del fabbro – Blacksmith**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Blacksmith [[clicca qui. -> G2Apprendista]]
  if !$evCassa:
    block hubTitle:
      ! {icon:Storybook} **La cassa del sindacato – Laborer's Union**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Laborer's Union [[clicca qui. -> G2Cassa]]
  if !$evWessel2:
    block hubTitle:
      ! {icon:Storybook} **Il giubileo del sindaco – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G2Wessel]]
  block hubTitle:
    ! **Evento del secondo Round**
  block hubDetails:
    > Di notte la torbiera fuma, anche d'estate: un fumo bianco, basso, che sale dal punto della luce e si allarga sull'acqua senza vento. Chi lo guarda troppo a lungo, dicono, non ha più voglia di andare a dormire. Va a sedersi sull'argine, e aspetta.
    if $fiducia >= 2:
      > Alla tenuta arrivano inviti a ogni festa, ogni battesimo, ogni matrimonio. Vi vogliono tutti. Vi aspettano tutti.
    elif $fiducia <= -2:
      > Alla tenuta non arriva più nessuno. La posta la lasciano al cancello. Il lattaio suona e se ne va prima che apriate.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    include SetePietra
    ui endOfRound progress="G2R2" next="G2Consiglio"

::round G2R2 5
fine: La Maturità della Seconda Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Vecchiaia prima di continuare.

:: G2Coro
  set evCoro = true
  # **Il coro**
  > Trijntje Kalf, la figlia del vecchio pastore, suona l'organo della chiesa da vent'anni. È una donna piccola, con le dita lunghe e un orecchio infallibile. Ti ferma dopo la funzione, sotto il portico. Il coro, dice, canta troppo bene. Trenta voci, e nessuna stona più, nessuna tossisce, nessuna prende fiato fuori tempo. Cantano come un uomo solo. Alla fine dell'inno, ogni domenica, il silenzio dura esattamente quattro battute, poi si siedono tutti insieme. Lei non ha mai insegnato a farlo.
  ! Che cosa fai?
  [[Domenica prossima canti con loro. ~> canta]]
  [[Ascolti chi respira. ~> ascolta]]
  fragment canta:
    set fiducia = $fiducia + 1
    > Canti con loro, e non hai mai cantato così bene. La tua voce si appoggia sulle altre come una barca sull'acqua, e per tutto l'inno non devi pensare a niente. È bellissimo. Quando l'inno finisce, ti siedi insieme a tutti gli altri, esattamente dopo quattro battute, e te ne accorgi soltanto dopo.
    block setupEvent next=$hub:
      ! Guadagni 2VP.
  fragment ascolta:
    > Ti siedi in fondo, con gli occhi chiusi, e ascolti. Metà del coro, tra una strofa e l'altra, non prende fiato. Non ne ha bisogno. Trijntje, all'organo, si volta verso di te, e per un momento sbaglia una nota, apposta, forte. Nessuno, nel coro, la segue nell'errore.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Insanity_Icon}.

:: G2FurtoChi
  set dopo = "G2Furto"
  goto ChiSei

:: G2Furto
  set evFurto = true
  # **La pietra, di notte**
  if $pietra == "famiglia":
    > Al Park, di notte, vicino allo stagno, ti aspettano in sei. Li conosci tutti: il capomastro Lambert, Piet Brink, il fabbro Jaap Mol, due commesse, il mugnaio. Sono gentili. Ti chiedono la pietra di {$pietraNome}. Non per loro, dicono: per il paese. La pietra soffre, lontana dall'acqua. E quando soffre, loro lo sentono. Ti chiedono di pensarci. Hanno tempo.
    [[Gliela consegni. ~> dai]]
    [[La nascondi in cantina. ~> nascondi]]
  else:
    > Al Park, di notte, l'acqua dello stagno brilla di una luce bassa e verdastra, che viene dal fondo, dal canale che porta alla torbiera. Laggiù, nel punto della luce, è affondata la pietra. Con gli stivali alti e una corda, dicono i torbai, si potrebbe ripescare.
    [[La ripeschi. ~> ripesca]]
    [[La lasci dov'è. ~> lascia]]
  fragment dai:
    set pietra = "torbiera"
    set pietraChi = ""
    set fiducia = $fiducia + 1
    > La notte dopo la porti all'argine, nel suo sacco. Ti aspettano in cento, con le lanterne, in silenzio. La prendono con cura, la passano di mano in mano fino alla riva, e la riportano nella torbiera in processione, cantando l'inno della domenica, a una sola voce. Quando la pietra affonda, smettono di cantare tutti insieme, e se ne tornano a casa.
    block setupEvent next=$hub:
      ! {$pietraNome} rimette il Crown token {icon:S3_CrownToken} sul **Park**. Guadagni $2: il consiglio, riconoscente, vi manda un dono.
  fragment nascondi:
    set fiducia = $fiducia - 1
    > La nascondi in cantina, dietro le botti, in una cassa di ferro chiusa con due lucchetti. Per una settimana, ogni notte, qualcuno bussa alla porta della tenuta. Tre colpi, piano. Quando apri non c'è nessuno, ma sul gradino c'è sempre una pozza d'acqua scura, che al mattino è sparita.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon} e 1 {icon:Insanity_Icon}.
  fragment ripesca:
    set pietra = "famiglia"
    set pietraChi = $chi
    set pietraNome = $nomeChi
::for L in A B C D
    if $chi == "%L%":
      set acqua%L% = $acqua%L% + 1
::endfor
    > Entri nella torbiera fino al petto, con una corda intorno alla vita e una lanterna. L'acqua è gelida, e per un momento ti sembra di non toccare il fondo. Poi la trovi, tra la torba molle: calda, liscia, viva sotto le dita. Quando la tiri fuori, tutta la torbiera sospira, piano, come una persona che si gira nel sonno.
    block setupEvent next=$hub:
      ! Prendi il Crown token {icon:S3_CrownToken} dal Park. Guadagni 1 {icon:Insanity_Icon}.
  fragment lascia:
    > Torni a casa con le scarpe bagnate e un pensiero che non riesci a scacciare: che laggiù, nel fondo, qualcosa sapeva che eri lì, e ti ha lasciato andare.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G2Respiro
  set evRespiro = true
  # **Un respiro**
  > Al cimitero, il becchino Siebe, vecchissimo, ti chiama da parte con un gesto. Da qualche notte, dice, quando la torbiera fuma, sente respirare sotto terra. Non nelle tombe: tra le tombe, dove non c'è nessuno. Un respiro lentissimo, uno al minuto, profondo, come di qualcuno che dorme sodo. Ti accompagna al punto, vicino al muro nuovo. Accosti l'orecchio all'erba. Silenzio. Poi, dopo un minuto, sotto la terra, qualcosa respira.
  ! Che cosa fai?
  [[Scavi, con Siebe. ~> scava]]
  [[Chiami la Ronda a vegliare. ~> ronda]]
  fragment scava:
    > Scavate fino a un metro, con la lanterna. Trovate l'acqua, scura e tiepida, e niente altro. Siebe dice che è l'acqua della torba, che sale e scende con la luna, e fa quel rumore. Lo dice senza guardarti. Poi riempie la buca in fretta, e ci pianta sopra una croce senza nome.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.
  fragment ronda:
    set ronda = $ronda + 1
    > La Ronda veglia tutta la notte nel cimitero, sei persone intorno a un fuoco, con le coperte. Il respiro, quella notte, tace. Ma all'alba, quando si alzano per andare via, l'erba intorno al fuoco è bagnata in un cerchio perfetto, come se qualcuno, sotto, si fosse avvicinato per scaldarsi.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G2Banco
  set evBanco = true
  # **Il banco di Fokke**
  > Al Farmer's Market, il banco della torba nera c'è ancora, e dietro il banco c'è ancora Fokke Tammer. Ha settant'anni passati, i capelli bianchi, e taglia ancora la torba da solo, ogni mattina, all'alba. Non usa più le bende: le mani sono lisce, senza calli, senza linee. Ti riconosce subito, e ti chiede notizie di tutti i tuoi parenti, vivi e morti, uno per uno, per nome. Non ne sbaglia uno.
  ! Che cosa fai?
  [[Gli chiedi di suo figlio Gerrit. ~> gerrit]]
  [[Gli chiedi della notte delle due luci. ~> notte]]
  fragment gerrit:
    set fiducia = $fiducia + 1
    > Fokke sospira. Gerrit è un bravo ragazzo, dice, ma ha preso dalla madre: si preoccupa troppo. Lui gli vuole bene lo stesso, come un padre deve. Poi ti chiede, gentile, di dire a Gerrit di smettere di scavare. "La torba è di tutti", dice. "Ma il fondo è di chi ci dorme."
    block setupEvent next=$hub:
      ! Guadagni $2.
  fragment notte:
    > Fokke ci pensa. Ricorda la luce, dice: bianca, senza calore. E la pietra nell'acqua, calda come una stufa, e il dolore alle mani. Poi ricorda di essersi chinato a guardare il fondo, perché sotto la pietra c'era qualcuno che dormiva, con la sua faccia. "Sembrava così stanco", dice Fokke. "Gli ho detto: dormi, faccio io." Poi ti dà il resto, giusto al centesimo.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Insanity_Icon}.

:: G2Apprendista
  set evApprendista2 = true
  # **L'apprendista del fabbro**
  > Al Blacksmith, Jaap Mol batte il ferro con la stessa forza di trent'anni fa. Il suo apprendista, un ragazzo dei Van Dam di sedici anni con le orecchie rosse, ti ferma sulla porta. Vuole andarsene, dice, ma non sa dove. Il maestro non sbaglia mai, non si arrabbia mai, non si stanca mai. Lo corregge con pazienza infinita. Ieri gli ha detto che presto anche lui imparerà a non sbagliare, e che basterà un bagno nel canale, una notte, come ha fatto lui. Il ragazzo ha paura dell'acqua.
  ! Che cosa fai?
  [[Lo prendi a lavorare alla tenuta. ~> prendi]]
  [[Gli dici di fare come dice il maestro. ~> maestro]]
  fragment prendi:
    set ronda = $ronda + 1
    set kees = true
    > Il ragazzo dei Van Dam si chiama Kees. Lavora nella torre, pulisce l'anello, lucida l'ottone, e sbaglia tutto quello che si può sbagliare: rovescia l'olio, si brucia, rompe un vetro. È una gioia averlo intorno. Jaap Mol non viene a riprenderselo. Manda soltanto, la settimana dopo, un regalo: un martello nuovo, perfetto.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Gears_Icon} e 1VP.
  fragment maestro:
    set vicini = $vicini + 1
    > Il ragazzo abbassa gli occhi e torna all'incudine. Una settimana dopo lo incroci al mercato: dritto, calmo, con le mani pulite e le orecchie pallide. Ti saluta per nome. Ti ringrazia del consiglio.
    block setupEvent next=$hub:
      ! Guadagni $2.

// L'offerta del consiglio: la cittadinanza d'onore, se la famiglia smette di indagare.
:: G2Consiglio
  # **L'offerta del consiglio**
  ui specialEvent
  ! **Lettera del consiglio comunale di {$townname} alla famiglia della tenuta – *1904.***
  > Il consiglio, all'unanimità, ha il piacere di conferire alla famiglia della tenuta la cittadinanza d'onore di {$townname}, con un vitalizio annuo e un posto riservato in prima fila a tutte le cerimonie, in riconoscimento di quarant'anni di servizio alla scienza e al paese.

  > Il consiglio confida che la famiglia vorrà, in cambio, rinunciare a ogni attività che possa turbare la quiete dei cittadini: ronde notturne, scavi nella torbiera, misurazioni non richieste. La quiete, a {$townname}, è un bene comune.

  > Firmato: il sindaco, Aldert Wessel. Il segretario, Piet Brink.
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: accettate l'offerta del consiglio.
  ! NAY: rifiutate.
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G2ConsiglioEsito" mode="Voting"

:: G2ConsiglioEsito
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[La famiglia accetta. (YAY) ~> si]]
  [[La famiglia rifiuta. (NAY) ~> no]]
  fragment si:
    set vicini = $vicini + 1
    set fiducia = $fiducia + 2
    set consiglio = "accettato"
    > La cerimonia si tiene al Town Hall, con la banda e i fiori. Il sindaco appunta sul petto di ogni erede una medaglia d'argento con lo stemma del paese, e stringe le mani una per una, con la sua mano fredda. Il vitalizio arriva puntuale il primo di ogni mese. Le lanterne della Ronda restano appese in cantina.
    block setupEvent next=G2Trijntje:
      ! Ogni giocatore guadagna $3.
  fragment no:
    set fiducia = $fiducia - 1
    set ronda = $ronda + 1
    set consiglio = "rifiutato"
    > Rispondete con una lettera cortese e breve. Il sindaco non si offende: vi ringrazia per la franchezza, vi assicura che l'offerta resta valida "per sempre", e la settimana dopo vi manda lo stesso una cesta di frutta. Al mercato, da quel giorno, i commercianti vi servono per ultimi, sempre con un sorriso.
    block setupEvent next=G2Trijntje:
      ! Ogni giocatore guadagna 1VP.

:: G2R3 [HUB]
  # **I VICINI SILENZIOSI – Vecchiaia**
  set round = 6
  if $hub != "G2R3":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Girate la Village Chronicle a **pagina 8**.
      set luogo = "Traveling Caravan"
      include PosaVicino
      ! *È il venditore dell'acqua della stella, tornato per la fiera, uguale a quarant'anni fa.*
      set pozzi = $pozzi + 1
      set _SetupImage = "S3_ParadoxToken"
      ! Mettete un token {icon:S3_ParadoxToken} sul **Park**.
  set hub = "G2R3"
  include VociComuni
  include VociRonda
  if !$evScavo:
    block hubTitle:
      ! {icon:Storybook} **Lo scavo – Park**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Park [[clicca qui. -> G2Scavo]]
  if !$evGerrit:
    block hubTitle:
      ! {icon:Storybook} **I due Tammer – Farmer's Market**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Farmer's Market [[clicca qui. -> G2Gerrit]]
  if !$evJoost:
    block hubTitle:
      ! {icon:Storybook} **Il termometro – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G2Joost]]
  if !$evPastore2:
    block hubTitle:
      ! {icon:Storybook} **Il vecchio pastore – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G2Pastore]]
  if !$evMacerie:
    block hubTitle:
      ! {icon:Storybook} **Le case che sprofondano – Builder's Office**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Builder's Office [[clicca qui. -> G2Macerie]]
  if !$evSiebe:
    block hubTitle:
      ! {icon:Storybook} **Il quaderno del becchino – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G2Siebe]]
  block hubTitle:
    ! **Evento del terzo Round**
  block hubDetails:
    > Gerrit Tammer scava ogni notte, nel punto della luce, con una lanterna e la vanga del padre. Il consiglio ha mandato due volte una lettera di diffida, molto cortese. Nel paese ordinato di {$townname}, ai margini della torbiera, si allarga ogni settimana una ferita di torba nera.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    include SetePietra
    ui endOfRound progress="G2R3" next="G2Dormienti"

::round G2R3 0
fine: La Vecchiaia della Seconda Generazione è finita.
poi: Eseguite le azioni di Fine Round, poi continuate con lo Storybook prima della Fine della Generazione.

:: G2Scavo
  set evScavo = true
  # **Lo scavo**
  > Al Park, dove lo stagno si apre nel canale della torbiera, Gerrit Tammer ha costruito una diga di sacchi di sabbia e prosciugato un tratto d'acqua grande come una stanza. Lavora con tre torbai, quelli della Ronda, a torso nudo, nel fango fino alle ginocchia. Hanno tagliato la torba a mattoni, strato dopo strato, per due metri. Laggiù, dice Gerrit, la torba è tiepida. E morbida, come una coperta.
  if $vanga != "":
    > {$vanga} è con loro, con la vecchia vanga dei Tammer in mano. Ogni colpo è più facile del precedente.
  ! Che cosa fai?
  [[Scendi a scavare con loro. ~> scava]]
  [[Porti da mangiare e da bere, e fai la guardia ($1). ~> porta]]
  fragment scava:
    > Scendi nella buca. La torba, sotto la vanga, cede come il pane fresco. A un certo punto la lama tocca qualcosa di morbido e liscio, che non è torba. Gerrit ti afferra il polso, bianco in faccia. "Domani", dice. "Con la luce. E con tutti."
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Bodies_Icon} e 1 {icon:Insanity_Icon}.
  fragment porta:
    set ronda = $ronda + 1
    > Porti pane, aringhe, birra, e resti sull'argine con una lanterna, a fare la guardia. Verso mezzanotte vedi arrivare, dalla strada del paese, una fila di figure in silenzio, con le mani in tasca. Si fermano a cinquanta passi dalla buca, e guardano. All'alba se ne vanno, tutte insieme.
    block setupEvent next=$hub:
      ! Paga $1 e guadagni 1VP.

:: G2Gerrit
  set evGerrit = true
  # **I due Tammer**
  > Al Farmer's Market, Fokke Tammer vende la sua torba nera, come ogni giorno, sereno, cortese. Dall'altra parte della piazza, appoggiato al muro, c'è suo figlio Gerrit, con le mani sporche di torba e la camicia strappata, che lo guarda. Non si parlano da un anno. Fokke, ogni tanto, gli sorride. Gerrit non ricambia.
  ! Che cosa fai?
  [[Parli con Fokke. ~> fokke]]
  [[Parli con Gerrit. ~> gerrit]]
  fragment fokke:
    set fiducia = $fiducia + 1
    > Fokke ti chiede, con dolcezza, di parlare a suo figlio. Ha paura che si faccia male, laggiù, nella buca. Ha paura per lui, dice, come ogni padre. E ha paura per quello che troverà: "Ci sono cose che si conservano meglio se nessuno le tira fuori." Ti regala un mattone di torba nera, per la stufa.
    block setupEvent next=$hub:
      ! Guadagni $2.
  fragment gerrit:
    > Gerrit non guarda te: guarda il padre. "Mio padre russava", dice. "Russava così forte che lo sentivano i vicini. Questo dorme come un sasso, senza un rumore. Da quarant'anni." Poi si stacca dal muro e se ne va, verso la torbiera, con la vanga in spalla.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken}.

:: G2Joost
  set evJoost = true
  # **Il termometro**
  > Al Town Hall, il dottor Joost Maas ha organizzato una campagna di vaccinazione: il vaiolo è arrivato nei paesi vicini. In fila, davanti al suo tavolo, c'è mezzo paese, ordinato, paziente, con la manica già arrotolata. Joost vaccina tutti, e a tutti, di nascosto, misura la temperatura. Quando arriva il tuo turno, ti mostra il termometro e ti chiede, piano, il permesso.
  if $joost > 0:
    > Ti ringrazia, sottovoce, per i disegni della maestra: da quel giorno, dice, non riesce più a non contare.
  ! Che cosa fai?
  [[Ti fai misurare. ~> misura]]
  [[Rifiuti. ~> rifiuta]]
  [[Gli chiedi di misurare la sua. ~> sua]]
  fragment misura:
    > Trentasei e otto. Joost guarda il termometro, poi te, e sospira di sollievo, così forte che quelli in fila si voltano. Ti stringe la mano: calda. Poi torna a vaccinare, e per tutto il pomeriggio canticchia.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 Prova {icon:S3_WeaponToken}.
  fragment rifiuta:
    set fiducia = $fiducia + 1
    > Joost non insiste. Annota il rifiuto sul Registro, con la data e l'ora, e accanto un punto di domanda. Quelli in fila, dietro di te, ti sorridono, comprensivi.
    block setupEvent next=$hub:
      ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon}.
  fragment sua:
    set joost = $joost + 1
    > Joost ride, nervoso. Poi, davanti a te, si mette il termometro sotto la lingua. Aspetta. Lo guarda. Lo scuote, e lo rimette. Lo guarda di nuovo. Trentasei e sei. Si siede, con le mani sulle ginocchia, e resta così per un po', come chi ha appena saputo di aver vinto una scommessa che non voleva fare.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Insanity_Icon}.

:: G2Pastore
  set evPastore2 = true
  # **Il vecchio pastore**
  > Il pastore Ewout Kalf ha novant'anni e sta morendo, nella canonica dietro la chiesa, con la figlia Trijntje accanto al letto. Ti ha fatto chiamare. Ha le mani calde e una voce sottile come la carta. Vuole sapere soltanto una cosa, prima di andarsene: quanti sono. Non dice chi. Non serve.
  if $kalf > 0:
    > Ti riconosce, o riconosce in te il genitore che gli diede ragione sul sagrato, tanti anni fa. Sorride.
  elif $kalf < 0:
    > Ti riconosce, o riconosce in te il genitore che lo contraddisse sul sagrato, tanti anni fa. Ti tende la mano lo stesso.
  ! Che cosa fai?
  [[Gli dici la verità. ~> verita]]
  [[Gli dici che sono pochi. ~> pochi]]
  fragment verita:
    set ronda = $ronda + 1
    > Gli dici il numero di Joost Maas: più della metà. Il pastore chiude gli occhi. Poi dice a Trijntje di continuare a suonare l'organo, sempre, ogni domenica, e di stonare una nota, una sola, ogni volta: "Così sapranno che ci sei ancora." Muore all'alba. Al funerale il coro canta perfettamente.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 Prova {icon:S3_WeaponToken}.
  fragment pochi:
    set fiducia = $fiducia + 1
    > Gli dici che sono pochi, e che diminuiscono. Il pastore ti guarda a lungo, con gli occhi lucidi, e ti ringrazia per la bugia: "Era gentile", dice. "È così che si riconoscono, ormai: dalla gentilezza." Muore all'alba. Trijntje non ti saluta, al funerale.
    block setupEvent next=$hub:
      ! Guadagni $2.

:: G2Macerie
  set evMacerie = true
  # **Le case che sprofondano**
  > Al Builder's Office il capomastro Lambert ha appeso al muro una mappa del paese, con delle crocette rosse. Sono le case che sprofondano: tre, in un anno, tutte vicino alla torbiera, tutte nella stessa direzione, verso lo scavo di Gerrit Tammer. I muri si crepano, i pavimenti si inclinano, e alla fine la casa cede, piano, come se il terreno, sotto, si fosse svuotato. Lambert dice che è lo scavo. Chiede alla famiglia della tenuta, "che ha tanta influenza", di farlo chiudere.
  ! Che cosa fai?
  [[Gli dai ragione e fai chiudere lo scavo per un mese. ~> chiudi]]
  [[Vai a vedere le case crollate. ~> vedi]]
  fragment chiudi:
    set fiducia = $fiducia + 1
    > Gerrit obbedisce, a denti stretti. Per un mese la buca si riempie d'acqua, e la torba si richiude, morbida, sopra quello che c'era sotto. Lambert ti ringrazia e ti regala la mappa, con le crocette. Le case, quel mese, smettono di sprofondare.
    block setupEvent next=$hub:
      ! Guadagni 1VP e $1.
  fragment vedi:
    > Nelle cantine delle case crollate, tra le macerie, il pavimento è sfondato, e sotto si apre un vuoto nella torba, lungo e stretto, come un letto. Dentro non c'è nessuno. Ma sul fondo l'impronta di un corpo è ancora tiepida, e porta verso la torbiera una scia larga come un uomo, che qualcuno, o qualcosa, ha trascinato.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.

// Secondo colpo di scena: gli originali dormono nella torba.
:: G2Dormienti
  # **Lo scavo di Gerrit**
  ! **Registro Maas – Joost Maas, *settembre 1914.***
  > Chiamato all'alba allo scavo di Gerrit Tammer, al Park. Presenti: Gerrit, i torbai della Ronda, alcuni membri della famiglia della tenuta, e io.

  > Sotto due metri di torba, in una cavità morbida come un letto, giace un uomo. Pelle bianca, capelli neri, vestiti da torbaio di cinquant'anni fa, le mani giunte sul petto. Le mani hanno ustioni recenti sui palmi, non ancora rimarginate. Temperatura corporea: trentuno gradi. Polso: quattro battiti al minuto. Respiro: uno al minuto, profondo, regolare. L'uomo dorme.

  > L'uomo è Fokke Tammer, all'età di quarant'anni circa. Lo riconosce il figlio Gerrit, che si è inginocchiato nel fango e non riesce ad alzarsi. Lo riconosco anch'io, dalle ustioni: le medicò mia madre. Fokke Tammer, quello di ottantotto anni, in questo momento è al Farmer's Market, dietro il suo banco, e serve i clienti.

  > **Gli originali non sono morti. Dormono nella torba, conservati come il giorno in cui sono stati presi. Quelli che camminano per {$townname} sono un'altra cosa.**

  > Ho controllato il mio polso tre volte, mentre scrivevo. Era normale.
  [[Clicca per continuare... => G2FokkeVoto]]

:: G2FokkeVoto
  # **Svegliarlo?**
  ui specialEvent
  > Gerrit vuole svegliarlo. Joost Maas dice che non sa che cosa succederebbe: un uomo che dorme da quasi cinquant'anni nella torba potrebbe non sopravvivere al risveglio, o sopravvivere in modo peggiore. E l'altro Fokke, quello del mercato, che cosa farebbe? Intanto, sull'argine, la gente del paese ha cominciato ad arrivare. Non si avvicina. Aspetta.
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: svegliate Fokke Tammer.
  ! NAY: lo ricoprite di torba, e lasciate che dorma.
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G2FokkeEsito" mode="Voting"

:: G2FokkeEsito
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Fokke si sveglia. (YAY) ~> sveglia]]
  [[Fokke torna a dormire. (NAY) ~> dorme]]
  fragment sveglia:
    set fokke = "svegliato"
    set vicini = $vicini - 1
    set fiducia = $fiducia - 1
    > Lo tirano fuori in sei, avvolto nelle coperte, e lo portano allo studio di Joost Maas, vicino alla stufa. Ci vogliono tre giorni. Il terzo giorno Fokke Tammer apre gli occhi, guarda il soffitto, poi Gerrit, che ha quasi sessant'anni e la barba grigia, e chiede chi è. Poi chiede che anno è. Poi chiede del gin.

    > Al Farmer's Market, quella mattina, l'altro Fokke smette di servire a metà di una frase, lascia il banco, e cammina dritto verso la torbiera. Nessuno lo segue. La sera torna, e riapre il banco il giorno dopo, come se niente fosse. Ma non saluta più nessuno per nome.
    block setupEvent next=G2Chiusura:
      ! Ogni giocatore guadagna 1 Prova {icon:S3_WeaponToken}.
  fragment dorme:
    set fokke = "sepolto"
    set fiducia = $fiducia + 1
    > Gerrit ricopre il padre con le sue mani, piangendo, mattone dopo mattone, come si rimbocca una coperta. Poi apre la diga e lascia che l'acqua torni. Sull'argine la gente del paese aspetta finché l'acqua non ha coperto tutto, poi torna a casa, in silenzio, tutta insieme. Al Farmer's Market, il giorno dopo, Fokke regala a Gerrit un mattone di torba nera. Gerrit lo accetta.
    block setupEvent next=G2Chiusura:
      ! Ogni giocatore guadagna 1VP.

:: G2Chiusura
  # **Fine della Generazione**
  ! **Registro Maas – Joost Maas, *1915.***
  > Scrivo l'ultima pagina della mia parte di Registro. La guerra è scoppiata l'anno scorso, e anche se il nostro paese non c'entra, mezza Europa brucia, e i ragazzi di {$townname} partono volontari per le ambulanze, per le fabbriche, per il fronte. Partono i figli della tenuta. Parte mia figlia Wilhelmina, che si è appena laureata in medicina e dice che al fronte servono medici più che qui. Ha ragione. Le ho dato l'orologio di mia madre, quello rotto: le porterà fortuna, o almeno le dirà che ora era quando ha smesso di funzionare.

  > I partenti hanno bevuto tutti l'acqua della fontana, la mattina della partenza, come vuole l'uso nuovo del paese: "per tornare". Wil no. Wil ha bevuto birra.
  if $consiglio == "accettato":
    > La medaglia del consiglio è appesa nell'ingresso della tenuta, accanto all'orologio a pendolo. Brilla. Nessuno la tocca.
  elif $consiglio == "rifiutato":
    > Il consiglio manda ancora la cesta di frutta, ogni mese. La frutta è perfetta. Alla tenuta la danno ai maiali.
  if $fokke == "svegliato":
    > Fokke Tammer, quello vero, vive con suo figlio Gerrit, in una casa sull'argine. Beve, bestemmia, russa, e non riconosce nessuno del paese. Dice che sono tutti troppo gentili. L'altro Fokke vende ancora la sua torba al mercato, dall'altra parte della piazza. Non si guardano mai.
  else:
    > Sotto la torba, nel punto dello scavo, Fokke Tammer dorme ancora. Gerrit ci porta i fiori la domenica, invece che sulla tomba della madre.
  include FineVicini
  ui endOfGeneration generation=6 text: Rimuovete tutti i pezzi dal tabellone ed eseguite la Fine della Generazione. Rimettete nella riserva i token {icon:StorybookToken} non usati. I Vicini {icon:S3_WoodenFigureToken} e i token {icon:S3_ParadoxToken} rimasti sul tabellone tornano nella riserva; chi ha bevuto tiene davanti a sé i suoi token {icon:S3_ParadoxToken}.
  [[Clicca per continuare... => VSG3Intro]]

// Arricchimento: un evento in più per la Maturità e per la Vecchiaia, una lettera dopo il consiglio.

:: G2Wessel
  set evWessel2 = true
  # **Il giubileo del sindaco**
  > Al Town Hall si festeggiano i quarant'anni di Aldert Wessel come sindaco di {$townname}. Ghirlande, un ritratto nuovo a olio, un coro di bambini in fila. Il sindaco ha ottant'anni e cammina dritto come un soldato. Il comitato chiede a qualcuno della tenuta, "la famiglia più antica del paese", di dire due parole di omaggio dal palco. Il foglio con il discorso è già pronto: lo ha scritto il segretario, Piet Brink.
  if $wessel == "moglie":
    > Sul tavolo d'onore, accanto alla torta, c'è un posto apparecchiato e vuoto, con un biglietto: *signora Wessel*. Il sindaco spiega che sua moglie è ancora dalla sorella, in città, e che gli ha scritto per scusarsi. La lettera è sul piatto. La calligrafia è quella del sindaco.
  ! Che cosa fai?
  [[Leggi il discorso del segretario. ~> leggi]]
  [[Improvvisi, e parli della signora Wessel. ~> moglie]]
  [[Declini l'onore. ~> declina]]
  fragment leggi:
    set fiducia = $fiducia + 1
    > Leggi il discorso: è perfetto, caldo, senza una parola fuori posto. Mentre leggi, ti accorgi che la sala muove le labbra insieme a te. Lo sanno a memoria. Alla fine applaudono, tutti nello stesso istante, e il sindaco ti abbraccia, freddo e commosso.
    block setupEvent next=$hub:
      ! Guadagni $2 e 1VP.
  fragment moglie:
    set fiducia = $fiducia - 1
    > Metti da parte il foglio e parli della signora Wessel: della sua risata da gallina, dei suoi cappelli orribili, delle liti con il marito che si sentivano fino alla piazza. Racconti com'era {$townname} quando la gente litigava. La sala ti ascolta in un silenzio perfetto. Il sindaco sorride per tutto il tempo. Quando hai finito, una vecchia in fondo alla sala piange. È l'unica.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.
  fragment declina:
    > Declini con garbo: la famiglia della tenuta non è brava con i discorsi. Il comitato non insiste. Al tuo posto parla il segretario Piet Brink, senza foglio, senza esitazioni, per venti minuti esatti. Il sindaco, alla fine, lo abbraccia come un figlio.
    block setupEvent next=$hub:
      ! Arretra di 1 casella sul tracciato {icon:Creepy_Icon}.

:: G2Siebe
  set evSiebe = true
  # **Il quaderno del becchino**
  > Al cimitero, nella casetta degli attrezzi accanto al cancello, il becchino Siebe sta morendo, a novantun anni, su una branda, con la gamba corta avvolta in una coperta. Ha mandato a chiamare qualcuno della tenuta. Dal materasso tira fuori un quaderno di scuola, unto e sgualcito, e te lo mette in mano. In cinquant'anni, dice, ogni volta che ha scavato una fossa e ha trovato l'acqua, ha guardato giù. E ogni volta che ha visto una faccia, laggiù, nella torba, l'ha scritta. Nome, data, profondità.
  if $evFosse:
    > La prima pagina è del 1868: *la moglie del mugnaio, terza fossa, sotto la cassa*. La tua famiglia c'era.
  > Le pagine sono quaranta. I nomi sono centinaia. "Non l'ho mai detto a nessuno", dice Siebe. "Non mi avrebbero creduto. E quelli che mi avrebbero creduto erano scritti qui."
  ! Che cosa fai?
  [[Prendi il quaderno. ~> prendi]]
  [[Lo bruci, come ti chiede lui. ~> brucia]]
  fragment prendi:
    set ronda = $ronda + 1
    > Siebe ti stringe la mano con le ultime forze, calda e ossuta, e chiude gli occhi. Muore quella notte, nel sonno, con la temperatura giusta: la misura Joost Maas, al mattino, e la scrive nel Registro sottolineata. Il quaderno lo porti alla tenuta e lo metti accanto al Registro. A leggerli insieme, i nomi si rispondono.
    block setupEvent next=$hub:
      ! Guadagni 2 Prove {icon:S3_WeaponToken}.
  fragment brucia:
    set fiducia = $fiducia + 1
    > Siebe ti chiede di bruciarlo: non vuole che, quando sarà morto, lo trovino "loro". Lo bruci nella stufa della casetta, pagina per pagina, davanti a lui. Lui guarda le pagine annerire e sorride, sollevato. "Adesso dormono in pace", dice. "Tutti. Anche io."
    block setupEvent next=$hub:
      ! Guadagni 1VP e arretra di 1 casella sul tracciato {icon:Insanity_Icon}.

:: G2Trijntje
  # **Una lettera**
  ! **Lettera di Trijntje Kalf a suo fratello Willem, missionario a Batavia – *1908.***
  > Caro Willem, nostro padre sta morendo, se ti interessa ancora saperlo. Novant'anni, la testa lucida, le mani calde: gliele controllo ogni mattina. Ogni sera mi chiede di suonargli qualcosa all'harmonium della canonica, e di stonare una nota, una sola, perché la senta. La domenica, in chiesa, il coro canta in modo perfetto. Mi viene voglia di urlare.
  if $consiglio == "accettato":
    > La famiglia della tenuta ha accettato la medaglia del consiglio. Non li biasimo: sono stanchi, come tutti noi. Però da quel giorno le lanterne della Ronda non escono più, e la notte, dal campanile, vedo la strada dell'argine piena di gente che cammina verso la torbiera in camicia da notte.
  else:
    > La famiglia della tenuta ha rifiutato la medaglia del consiglio. Nostro padre ne è fiero. In paese li trattano con una gentilezza così perfetta che fa male guardarla. Al mercato li servono per ultimi, sorridendo.
  if $scudo != "":
    > La Ronda di {$scudo} esce ancora, due notti a settimana. Io porto il tè caldo. Siamo rimasti in pochi, ma stoniamo tutti benissimo.
  > Gerrit Tammer, il figlio del torbaio, scava ancora, al Park, nel punto della luce. Dice che è vicino. A che cosa, non lo dice. Ti prego, Willem, non tornare a {$townname}. Resta dove fa caldo, dove la gente suda e si lamenta e muore di febbre. Qui non muore più nessuno, e io ho paura di non riuscire a morire nemmeno io. La tua Trijntje.
  [[Continua... => G2R3]]

// Arricchimento: all'inizio della Seconda Generazione ogni erede riceve in segreto un sogno.
// Pagine di lunghezza simile; cambiano con l'acqua scura bevuta dalla famiglia nella Prima.
::for L in A B C D | Fine
:: G2Sogno%L%
  if %L.n% > $players:
    goto G2SognoFine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **Il primo sogno**
  if $acqua%L% >= 2:
    > Sogni l'argine, di notte, e i tuoi piedi nudi sull'erba bagnata. Cammini verso la torbiera senza volerlo, e non hai freddo. Nel punto della luce, con l'acqua fino al petto, qualcuno ti aspetta: ha la tua faccia, i tuoi capelli, i tuoi vestiti. Ti tende la mano, con un sorriso così sereno che ti viene voglia di piangere. Più in là, sotto l'acqua, dormono i tuoi genitori.
  elif $acqua%L% == 1:
    > Sogni la tenuta com'era nella tua infanzia, con i tuoi genitori al tavolo della cucina. Chi ti ha cresciuto ti versa un bicchiere d'acqua, scura, dalla brocca, e ti dice di bere, che fa bene: l'ha bevuta una volta sola, ed è stata la sera più tranquilla della sua vita. Le mani, sulla brocca, sono bianche. Fuori dalla finestra, la torbiera fuma.
  else:
    > Sogni la torre, con la porta saldata e le vetrate buie. Sali la scala a spirale e non arrivi mai in cima: i gradini continuano, uno dopo l'altro, mentre in alto qualcosa ronza, piano, come api in un muro. A metà scala trovi un orologio d'argento sul gradino, con il vetro incrinato. Segna le undici e un quarto. Lo prendi, ed è caldo.
  ! Che cosa fai, nel sogno?
  [[Vai avanti. ~> avanti]]
  [[Ti svegli. ~> sveglia]]
  fragment avanti:
    if $acqua%L% >= 1:
      > Vai avanti, e il sogno diventa dolce, lentissimo, senza paura. Ti svegli all'alba con le mani fredde e una pace che non ti appartiene. Ci vuole un'ora perché passi.
    else:
      > Vai avanti, e la scala finisce di colpo: davanti a te c'è l'anello d'ottone, acceso, bianco. Ti svegli all'alba con l'orologio in mano. No: con la mano stretta sul nulla, come se lo stringessi davvero.
    block setupEvent next=G2Sogno%L.next%:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment sveglia:
    > Ti svegli di colpo, nel tuo letto, con il cuore che batte forte. Ti tocchi le mani: sono calde. Non riprendi sonno fino all'alba, e ascolti il silenzio di {$townname}, che è più profondo di quanto ricordassi.
    block setupEvent next=G2Sogno%L.next%:
      ! Guadagni $1.
::endfor

:: G2SognoFine
  # **A colazione**
  > La mattina dopo, a colazione, nessuno racconta il proprio sogno. Vi guardate le mani, di nascosto, sopra le tazze. Dalla finestra si vede la torbiera, piatta e grigia, e la torre, dritta contro il cielo. Qualcuno, al cancello, sta già suonando il campanello: è un signore del consiglio.
  [[Continua... => G2Inizio]]

:: G2Ghiaccio
  set evGhiaccio = true
  # **Il ghiaccio dello stagno**
  > Al Park, d'inverno, lo stagno gela, e i bambini di {$townname} ci pattinano sopra, tutti insieme, in cerchio, senza mai scontrarsi. Tutti tranne uno: il più piccolo della classe della maestra Borg, otto anni, che pattina male, cade, ride, piange, e si rialza. Oggi è caduto dove il ghiaccio è sottile, vicino al canale che porta alla torbiera, e il ghiaccio si è aperto. Gli altri bambini si sono fermati sulla riva, in fila, e guardano. Nessuno grida. Il bambino si aggrappa al bordo, e l'acqua scura gli arriva al mento.
  if $cane == "preso":
    > Il cane della tenuta, un nipote di Bruin, si lancia sul ghiaccio abbaiando, prima di tutti.
  ! Che cosa fai?
  [[Ti butti nell'acqua a prenderlo. ~> tuffo]]
  [[Lo tiri fuori con un bastone, sdraiandoti sul ghiaccio. ~> bastone]]
  fragment tuffo:
    set ronda = $ronda + 1
    > L'acqua è così fredda che per un istante non senti più niente: né le mani, né il cuore, né la paura. È una sensazione meravigliosa. Poi il bambino ti si aggrappa al collo, piangendo, e il freddo torna, terribile, umano. Lo porti a riva. La maestra Borg, arrivata di corsa, vi avvolge tutti e due nel suo scialle. Il bambino trema e strilla per un'ora. È la cosa più bella che tu abbia mai sentito.
    block setupEvent next=$hub:
      ! Guadagni 2VP e 1 {icon:Insanity_Icon}.
  fragment bastone:
    > Ti sdrai sul ghiaccio, allunghi un ramo, e il bambino lo afferra al secondo tentativo. Lo tiri fuori fradicio, livido, con i denti che battono. Sta bene. Mentre lo riporti a riva, i bambini in fila sulla sponda ti guardano senza un'espressione, poi riprendono a pattinare, in cerchio, tutti insieme, come se niente fosse.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 Prova {icon:S3_WeaponToken}.

:: G2Cassa
  set evCassa = true
  # **La cassa del sindacato**
  > Al Laborer's Union, il vecchio capo del sindacato dei braccianti, Teun Bos, sta chiudendo l'ufficio per sempre. Non c'è più bisogno di un sindacato, dice: nessuno chiede aumenti, nessuno si lamenta dei turni, nessuno si fa male. La cassa di mutuo soccorso, quella per le vedove e i malati, è piena: in vent'anni non è servita a nessuno. Teun vorrebbe darla alla tenuta, "che ancora si ammala", oppure al consiglio, che l'ha chiesta per costruire una fontana nuova in piazza.
  ! Che cosa fai?
  [[Accetti la cassa per la famiglia. ~> accetta]]
  [[Gli dici di darla al consiglio. ~> consiglio]]
  [[Gli dici di tenerla, per quando servirà. ~> tieni]]
  fragment accetta:
    set fiducia = $fiducia - 1
    > Teun ti consegna la cassa di latta con le monete e il registro delle quote, e ti stringe la mano, calda, callosa. "Usatela per chi ancora sta male", dice. Il consiglio, saputa la cosa, vi manda una lettera di congratulazioni. Gentilissima.
    block setupEvent next=$hub:
      ! Guadagni $3.
  fragment consiglio:
    set vicini = $vicini + 1
    set fiducia = $fiducia + 1
    > La fontana nuova viene inaugurata in primavera: bronzo, marmo, tre bocche che versano acqua scura direttamente dal canale della torbiera. I bambini ci bevono uscendo da scuola. Teun Bos, il giorno dell'inaugurazione, beve anche lui, e smette di tossire.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment tieni:
    set ronda = $ronda + 1
    > Teun annuisce, lentamente, e rimette la cassa sotto il pavimento, dove l'ha sempre tenuta. Ti dà la chiave dell'ufficio, "nel caso", e se ne va. Nel registro delle quote, l'ultima pagina è bianca, con una data in alto. Teun l'ha lasciata così per chi verrà dopo.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1VP.

