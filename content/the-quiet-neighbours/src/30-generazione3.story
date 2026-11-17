// Terza Generazione – "Il ritorno" (1919).
// Pagine della Chronicle: ATOW 16 (Giovinezza), ATOW 19 (Maturità), FotU 21 (Vecchiaia).
// Testo italiano completo, rivisto per coerenza.

:: VSG3Intro [INTRO voice]
  # **GENERAZIONE III: Il ritorno**
  ! **Registro Maas – dottoressa Wil Maas, *luglio 1919.***
  > Sono tornata a Brunveen a giugno, dopo quattro anni negli ospedali da campo delle Fiandre, con una valigia, una medaglia che non ho chiesto e l'orologio rotto della nonna Hester nel taschino. Mio padre Joost è morto l'inverno scorso, di influenza, con trentanove di febbre: me l'hanno scritto nel telegramma, e ne sono stata contenta. Mi ha lasciato lo studio e questo Registro.

  > Brunveen è diventata una cittadina: la luce elettrica, il telefono al Town Hall, una University con tre facoltà, due giornali, una banca cooperativa. Le strade sono pulite. Gli abitanti sono gentili, sani, laboriosi. È il posto più tranquillo in cui io sia mai stata, e io vengo dalla guerra.

  > I ragazzi partiti volontari sono tornati quasi tutti. È questo che mi preoccupa. Al fronte ne sono morti a milioni, e da Brunveen ne sono partiti quaranta e ne sono tornati trentotto, sani, senza una cicatrice, senza un incubo. Alla stazione li aspettava la banda, e alla fontana della piazza un bicchiere d'acqua scura per ciascuno, "per bentornati".

  > Gli eredi della tenuta sono tornati anche loro. Domani passerò a visitarli, uno per uno, e firmerò per ciascuno un certificato di buona salute. Il consiglio lo chiede per tutti i reduci. Io lo firmerò solo dopo aver misurato.
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    set scudoUsato = false
    block setupEvent next=G3R1:
      include AzzeraTraguardi
      include PosaTraguardi
      set _SetupImage = "S3_MonarchisToken"
      ! Ogni giocatore prende un **Separatist/Monarchist token** dalla Scatola di **A Time of War**: è il suo **certificato del medico**. Lo mette sotto il suo Player Aid, senza mostrarlo, con il lato **Monarchist** (la corona) verso l'alto: sano. Non lo tocca finché lo Storybook non lo dice.

:: G3R1 [HUB]
  # **I VICINI SILENZIOSI – Giovinezza**
  set round = 7
  if $hub != "G3R1":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Aprite la Village Chronicle alla sezione **A Time of War** ({icon:S3_ScenarioIcon}) e andate a **pagina 16**.
      include PreparaFolla
      set luogo = "Credit Union"
      include PosaVicino
      ! *È il cassiere della banca cooperativa: non ha mai sbagliato un conto.*
      set pozzi = $pozzi + 2
      set _SetupImage = "S3_ParadoxToken"
      ! Mettete un token {icon:S3_ParadoxToken} sul **Park** e uno sul **General Store**.
      ! Il **Technician** di questa pagina usa i token **Circuitry**, **Gasoline** e **Vitamin**: prendeteli dalla Scatola di **A Time of War** e metteteli accanto al tabellone.
  set hub = "G3R1"
  include VociComuni
  include VociRonda
  if !$evFesta:
    block hubTitle:
      ! {icon:Storybook} **La festa del ritorno – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G3Festa]]
  if !$evBram:
    block hubTitle:
      ! {icon:Storybook} **Il sindaco Bram Wessel – Credit Union**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Credit Union [[clicca qui. -> G3Bram]]
  if !$evLavori:
    block hubTitle:
      ! {icon:Storybook} **I pezzi della Macchina – Blacksmith**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Blacksmith [[clicca qui. -> G3LavoriChi]]
  if !$evWil:
    block hubTitle:
      ! {icon:Storybook} **La dottoressa – University**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla University [[clicca qui. -> G3Wil]]
  if !$evMonumento:
    block hubTitle:
      ! {icon:Storybook} **I nomi sul monumento – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G3Monumento]]
  if !$evNozze:
    block hubTitle:
      ! {icon:Storybook} **Il matrimonio del reduce – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G3Nozze]]
  if !$evTecnico:
    block hubTitle:
      ! {icon:Storybook} **La luce elettrica – Technician**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Technician [[clicca qui. -> G3Tecnico]]
  block hubTitle:
    ! **Evento del primo Round**
  block hubDetails:
    > Bandiere a ogni finestra, la banda in piazza, i reduci in prima fila davanti al Town Hall con le medaglie appuntate sul petto. L'acqua scura è dappertutto: nelle fontane, nelle caraffe dei caffè, nei bicchieri del brindisi. A Brunveen, ormai, la chiamano soltanto "l'acqua".
    if $consiglio == "accettato":
      > La famiglia della tenuta siede in prima fila, al posto d'onore che il consiglio le assegnò anni fa, con la medaglia d'argento appuntata sul petto. Dietro, trecento persone vi guardano la nuca.
    elif $consiglio == "rifiutato":
      > Per la famiglia della tenuta non è previsto un posto. Restate in piedi, in fondo alla piazza, accanto a Trijntje Kalf e alla maestra Borg. Nessuno vi chiede di andarvene.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    include SetePietra
    ui endOfRound progress="G3R1" next="G3Sostituzione"

::round G3R1 7
fine: La Giovinezza della Terza Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Maturità prima di continuare.

:: G3Festa
  set evFesta = true
  # **La festa del ritorno**
  > Al Town Hall, nel salone delle cerimonie, si festeggiano i reduci. Il sindaco Bram Wessel, figlio del vecchio Aldert, fa un discorso breve e perfetto sul sacrificio e sulla pace. Poi i camerieri passano tra gli invitati con i vassoi: bicchieri di cristallo pieni d'acqua scura, "la più buona della provincia". Il sindaco alza il suo. Trecento persone alzano il loro, nello stesso momento. Tutti guardano voi.
  ! Che cosa fai?
  [[Brindi con loro. ~> brinda]]
  [[Versi il bicchiere nel vaso dei fiori. ~> versa]]
  [[Brindi con il vino che hai portato. ~> vino]]
  fragment brinda:
    set vicini = $vicini + 1
    set fiducia = $fiducia + 1
    > Bevi. Il salone applaude, e tu senti l'applauso come un abbraccio. Per il resto della sera tutto è facile: le parole, i sorrisi, le strette di mano fredde. Torni a casa a piedi, cantando a mezza voce l'inno della domenica, e non sai di saperlo a memoria.
    block setupEvent next=$hub:
      ! Guadagni 2VP.
  fragment versa:
    > Con un gesto piccolo, mentre tutti bevono, versi l'acqua nel vaso dei gigli. Nessuno se ne accorge, o così sembra. Il giorno dopo i gigli del vaso sono perfetti: aperti, bianchi, profumati. Gli altri, negli altri vasi, sono appassiti.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken}.
  fragment vino:
    set fiducia = $fiducia - 1
    > Tiri fuori dalla giacca una fiaschetta di vino e brindi con quello, sorridendo. Il silenzio dura un istante di troppo. Poi il sindaco ride, cortese, e tutti ridono con lui. Al tavolo, per il resto della sera, nessuno ti versa più niente.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Creepy_Icon}.

:: G3Bram
  set evBram = true
  # **Il sindaco Bram Wessel**
  > Alla Credit Union, la banca cooperativa che il consiglio ha fondato dopo la guerra, il sindaco Bram Wessel ti riceve nell'ufficio del direttore. Ha cinquantaquattro anni, i capelli grigi pettinati con cura, la stessa memoria prodigiosa del padre. Il vecchio Aldert è morto dieci anni fa, dice, di vecchiaia, nel sonno: un uomo felice. Il consiglio ha preso molte decisioni, dopo la guerra, e una riguarda la vostra famiglia.
  if $pietra == "famiglia":
    > Vorrebbe comprare la pietra di {$pietraNome}. Non per sé: per il paese. La metterebbe nella torbiera, al suo posto, "dove fa il bene di tutti". Offre una somma che fa girare la testa. Ha già preparato il contratto.
    [[Gliela vendi. ~> vendi]]
    [[Rifiuti. ~> rifiuta]]
  else:
    > Vorrebbe che la pietra restasse dov'è, nella torbiera, per sempre. Il consiglio ha votato di proteggere il punto della luce come monumento cittadino, con una recinzione e un custode. Chiede alla famiglia di non ripescarla, "per il bene di tutti".
    [[Gli dai la tua parola. ~> ragione]]
    [[Gli dici che non puoi promettere niente. ~> rifiuta]]
  fragment vendi:
    set pietra = "torbiera"
    set pietraChi = ""
    set fiducia = $fiducia + 1
    > Firmi. Il sindaco ti paga in contanti, nuovi, profumati di stampa, e la sera stessa porta la pietra all'argine con il consiglio al completo. La getta nella torbiera davanti a tutti. Quando affonda, la gente sull'argine sospira, tutta insieme, come chi si toglie un peso.
    block setupEvent next=$hub:
      ! {$pietraNome} guadagna $5 e rimette il Crown token {icon:S3_CrownToken} sul **Park**.
  fragment ragione:
    set fiducia = $fiducia + 1
    > Gli dai la tua parola, e lui ti stringe la mano a lungo. È fredda, ma la stretta è sincera. "Sapevo di potermi fidare", dice. "Siete gente di qui."
    block setupEvent next=$hub:
      ! Guadagni $2.
  fragment rifiuta:
    set fiducia = $fiducia - 1
    > Il sindaco non si offende. Non si offende mai nessuno, a Brunveen. Ripone il contratto nel cassetto, con cura, e ti accompagna alla porta. "Il consiglio ha tempo", dice. "Molto più di voi."
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.

:: G3LavoriChi
  set dopo = "G3Lavori"
  goto ChiSei

:: G3Lavori
  set evLavori = true
  # **I pezzi della Macchina**
  > Al Blacksmith, che ormai è un'officina meccanica con il tornio elettrico, il nipote di Jaap Mol tiene da parte una cassa per la famiglia della tenuta: pezzi d'ottone, filo di rame, lastre di vetro nero. Li ha ordinati, dice, il vecchio Jaap prima di morire, "per quando la Macchina servirà". In officina c'è anche un signore del consiglio, che offre di comprare tutta la cassa, a qualunque prezzo. Per il museo, dice.
  if $disegni:
    > Con questi pezzi, e con il segmento di ricambio che la vostra famiglia tiene in cantina da quando lo pagò alla fonderia, l'anello sarebbe completo.
  if $chi == $macchina:
    > Il signore del consiglio si rivolge a te, con un sorriso: sa che la Macchina è tua. Ti offre il doppio, se lasci perdere.
    [[Prendi il denaro del consiglio. ~> denaro]]
    [[Prendi i pezzi. ~> pezzi]]
  else:
    > La Macchina, però, è di {$macchinaNome}.
    [[Porti i pezzi a {$macchinaNome}. ~> porta]]
    [[Li lasci al signore del consiglio. ~> denaro]]
  fragment denaro:
    set fiducia = $fiducia + 1
    set vicini = $vicini + 1
    > Il signore del consiglio paga e fa caricare la cassa su un carro. Il carro prende la strada dell'argine, non quella del museo. La sera, dalla torre, vedi la cassa galleggiare un momento sulla torbiera, poi affondare, piano.
    block setupEvent next=$hub:
      ! Guadagni $3.
  fragment pezzi:
    > Porti la cassa nella torre e lavori tutta la notte. Ogni pezzo combacia, come se fosse stato fatto ieri. Verso l'alba l'anello, per un istante, ronza: un ronzio basso, come di api dentro un muro. Poi tace.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Gears_Icon} e 1 Conoscenza Ingegneristica (Engineering Knowledge).
  fragment porta:
    > Carichi la cassa sul tuo carro sotto gli occhi del signore del consiglio, che non dice niente. {$macchinaNome} ti aspetta alla torre, con le mani sporche di grasso, e ti abbraccia.
    block setupEvent next=$hub:
      ! Guadagni 1VP. {$macchinaNome} guadagna 1 {icon:Gears_Icon}.

:: G3Wil
  set evWil = true
  # **La dottoressa**
  > All'University, nel laboratorio di fisiologia che le hanno prestato, Wil Maas misura temperature. Ha trentatré anni, i capelli corti, le mani rovinate dal disinfettante, e fuma sigarette inglesi una dietro l'altra. Al fronte, racconta, ha visto uomini tornare dalla terra di nessuno dopo tre giorni nel fango, con le mani fredde e un sorriso tranquillo, e mettersi in fila per il rancio come se niente fosse. I medici li chiamavano "i fortunati". Lei li chiamava in un altro modo, e non lo scriveva.
  ! Che cosa fai?
  [[La aiuti con le misurazioni. ~> aiuta]]
  [[Le chiedi del Registro della nonna. ~> registro]]
  fragment aiuta:
    set ronda = $ronda + 1
    > Passi il pomeriggio con lei: un nome, un termometro, un numero, il prossimo. Tre mani fredde in quattro ore, tutte reduci, tutte sorridenti. Alla fine Wil accende l'ultima sigaretta e ti chiede se, di notte, sogni. Rispondi di sì. Lei annuisce, e ti scrive il numero sul polso, con la penna, "per ricordartelo".
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1VP.
  fragment registro:
    > Wil tira fuori dal taschino l'orologio della nonna Hester, vecchio, consumato, con il vetro incrinato e lo stemma della vostra famiglia sul coperchio. È fermo sulle undici e un quarto da quando lei è nata. "La nonna diceva che era vostro", dice. "Che vostro bisnonno l'aveva trovato sul pavimento della torre. Mio padre diceva che era una delle sue storie." Lo rimette nel taschino. "Io ci credo."
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge).

:: G3Monumento
  set evMonumento = true
  # **I nomi sul monumento**
  > Al cimitero sull'argine stanno montando il monumento ai caduti: un obelisco di granito con un angelo in cima. I nomi incisi sono due: i due ragazzi di Brunveen che non sono tornati. Ma lo scalpellino ha un problema, e te lo mostra: il consiglio gli aveva mandato, a marzo, una lista di cinque nomi. Poi, a giugno, una lista nuova, con due nomi soltanto. Gli altri tre sono tornati, dice il consiglio. Lo scalpellino li ha visti alla festa. Ha visto anche i telegrammi del ministero che li davano per morti.
  if $tomba == "torba":
    > Accanto al monumento c'è la tomba del vostro bisnonno, coperta dalla torba nera di Fokke Tammer: in cinquant'anni non ci è cresciuto un filo d'erba.
  elif $tomba == "pietra":
    > Accanto al monumento c'è la tomba del vostro bisnonno, con la lastra di granito inclinata, come se sotto qualcosa avesse spinto per mezzo secolo senza mai riuscire a uscire.
  ! Che cosa fai?
  [[Ti fai dare i nomi dei tre. ~> nomi]]
  [[Dici allo scalpellino di incidere tutti e cinque i nomi. ~> incidi]]
  fragment nomi:
    > Lo scalpellino ti dà il foglio. Tre nomi di ragazzi di Brunveen, dispersi nel fango delle Fiandre nel 1917, e tornati a casa nel 1919, sani, senza documenti, con i vestiti asciutti. Uno dei tre è Jan Hoek, il cugino di Hendrik Tammer. Hendrik, il nipote di Fokke, è tornato con i documenti in regola e una ferita alla spalla.
    block setupEvent next=$hub:
      ! Guadagni 2 Prove {icon:S3_WeaponToken}.
  fragment incidi:
    set fiducia = $fiducia - 1
    > Lo scalpellino incide i cinque nomi, e il giorno dell'inaugurazione il sindaco li legge tutti, senza esitare, con la stessa voce. I tre "tornati" sono in prima fila, con le medaglie. Ascoltano il proprio nome sul monumento dei morti senza battere ciglio. Poi applaudono, insieme agli altri.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Creepy_Icon}.

:: G3Tecnico
  set evTecnico = true
  # **La luce elettrica**
  > Al Technician, l'officina dove si riparano le dinamo e si vende il materiale elettrico, l'ingegnere della compagnia della luce, un uomo della città con la paglietta e la cravatta a farfalla, sta preparando il progetto per la nuova linea dell'argine. Ha un problema: la torre della tenuta è il punto più alto della zona, e la compagnia vorrebbe metterci in cima un isolatore. Ha visto l'anello d'ottone, dalla strada, e ha chiesto che cos'è. Nessuno in paese ha saputo rispondergli. Nessuno, dice, ha voluto.
  ! Che cosa fai?
  [[Gli dai il permesso, in cambio di una linea per la torre. ~> linea]]
  [[Gli dici di girare alla larga dalla torre. ~> larga]]
  fragment linea:
    set corrente = true
    > L'ingegnere accetta con entusiasmo. In una settimana la torre ha un isolatore, un cavo, un contatore e una lampadina che pende sopra l'anello d'ottone. La prima sera che la accendete, tutte le lastre di vetro nero si illuminano di riflesso, per un istante, come un occhio che si apre e si richiude.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Ingegneristica (Engineering Knowledge) e 1 {icon:Gears_Icon}.
  fragment larga:
    > L'ingegnere alza le spalle e sposta la linea di trecento metri, verso la torbiera. Il palo nuovo lo piantano nel punto più vicino alla luce. Due settimane dopo, il palo è inclinato. Dopo un mese, è sparito, inghiottito dalla torba fino all'isolatore.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

// Terzo colpo di scena: uno dei giocatori viene sostituito (design, sezione 8).
// Il candidato è chi ha bevuto più acqua scura (chi ha la pietra conta 1 in più); i pari a caso.
// Con due giocatori, una volta su tre nessuno.
:: G3Sostituzione
  set copia = ""
  set massimo = 0
  set pari = 0
::for L in A B C D
  if %L.n% <= $players:
    set tmp = $acqua%L%
    if $pietra == "famiglia" && $pietraChi == "%L%":
      set tmp = $tmp + 1
    if $tmp > $massimo:
      set massimo = $tmp
::endfor
::for L in A B C D
  if %L.n% <= $players:
    set tmp = $acqua%L%
    if $pietra == "famiglia" && $pietraChi == "%L%":
      set tmp = $tmp + 1
    if $tmp == $massimo:
      set pari = $pari + 1
      if random(1, $pari) == 1:
        set copia = "%L%"
        set copiaNome = $name%L%
::endfor
  if $players == 2 && random(1, 3) == 1:
    set copia = ""
    set copiaNome = ""
  goto G3NotteA

// Una pagina segreta per tutti, della stessa lunghezza: nessuno si tradisce dal tempo di lettura.
::for L in A B C D | Fine
:: G3Notte%L%
  if %L.n% > $players:
    goto G3NotteFine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **La notte dopo la festa**
  if $copia == "%L%":
    > Ti svegli nell'acqua della torbiera, in piedi, con l'acqua fino alla vita. È l'alba. Non hai freddo. Ricordi tutto: la tua infanzia, la guerra, la festa, il nome di ogni persona che ami. Sei ancora tu. Soltanto, per la prima volta in vita tua, sei in pace. Le mani sono fredde. Sotto di te, nella torba, qualcuno con la tua faccia dorme profondamente. Non svegli quel corpo addormentato: sembra così stanco.
    ! **Sei la Copia.** Non dirlo a nessuno. Gira il tuo certificato sotto il Player Aid sul lato **Separatist**. A fine partita guadagni 1VP per ogni Vicino {icon:S3_WoodenFigureToken} sul tabellone e 3VP se la pietra {icon:S3_CrownToken} è nella torbiera.
  else:
    > Sogni la torbiera all'alba, immersa fino alla vita, ferma come uno specchio. Qualcuno con la tua faccia esce dall'acqua, asciutto, e cammina verso il paese senza voltarsi. Ti svegli di soprassalto, nel tuo letto, con il sudore sulla fronte e il cuore in gola. È stato soltanto un sogno. Forse l'ultimo che farai.
    ! Non sei la Copia. Uno di voi potrebbe esserlo, o forse nessuno: osservate chi beve, e chi non ha più paura. Non toccare il tuo certificato.
  ! Che cosa fai, adesso?
  [[Ti alzi e guardi fuori. ~> uno]]
  [[Torni a dormire. ~> due]]
  fragment uno:
    > Dalla finestra si vede la torbiera, piatta e grigia sotto il cielo dell'alba. Nel punto della luce, per un momento, l'acqua si increspa.
    block setupEvent next=G3Notte%L.next%:
      ! Guadagni $1.
  fragment due:
    > Il sonno arriva subito, profondo e senza sogni, e al risveglio ti senti in forze come non ti capitava da anni.
    block setupEvent next=G3Notte%L.next%:
      ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon}.
::endfor

:: G3NotteFine
  # **Il mattino**
  > Il mattino dopo la festa, Brunveen è più quieta del solito. Al mercato si parla piano, al caffè nessuno legge il giornale ad alta voce, i bambini vanno a scuola in fila senza correre. Alla tenuta la colazione è servita alle otto, come sempre. Vi sedete a tavola tutti insieme, e vi guardate, a lungo, senza dire niente. Poi qualcuno chiede il sale, e qualcuno lo passa.
  ! Che cosa fate, a colazione? *(Decidete insieme.)*
  [[Vi raccontate i sogni della notte. ~> sogni]]
  [[Vi toccate le mani, a turno, sopra la tovaglia. ~> mani]]
  [[Fate finta di niente. ~> niente]]
  fragment sogni:
    > Ve li raccontate, uno dopo l'altro: l'argine, l'acqua fino alla vita, qualcuno con la vostra faccia. Sono sogni quasi uguali. Quasi. Uno di voi, quando tocca il suo turno, racconta un sogno bello, tranquillo, pieno di luce; e tutti, a tavola, smettete di mangiare.
    block setupEvent next=G3Orologio:
      ! Ogni giocatore guadagna 1 {icon:Insanity_Icon}.
  fragment mani:
    set ronda = $ronda + 1
    > Vi prendete le mani sopra la tovaglia, a catena, come in una seduta spiritica. Nessuno parla. Qualche mano è calda, qualche mano è tiepida: è novembre, la stufa non tira, il caffè si è raffreddato. Nessuno di voi lascia la presa per primo. Quando finalmente vi staccate, nessuno ha capito niente, e tutti hanno paura.
    block setupEvent next=G3Orologio:
      ! Ogni giocatore guadagna 1 Prova {icon:S3_WeaponToken}.
  fragment niente:
    set fiducia = $fiducia + 1
    > Fate finta di niente. Parlate del tempo, della festa, del discorso del sindaco. È una colazione perfetta, cortese, tranquilla, come quelle che fanno tutte le famiglie di Brunveen. Ve ne accorgete, a un certo punto, tutti nello stesso momento.
    block setupEvent next=G3Orologio:
      ! Ogni giocatore guadagna $1.

// Quarto colpo di scena: la Macchina sposta le cose anche nel tempo.
:: G3Orologio
  # **L'orologio**
  ! **Registro Maas – Wil Maas, *11 novembre 1919.***
  > Chiamata alla torre della tenuta alle undici e mezzo di sera, da {$macchinaNome}, che aveva la voce di chi non sa se ridere o piangere.

  > Racconto quello che mi è stato raccontato, e quello che ho visto. {$macchinaNome} lavora da mesi alla Macchina del bisnonno, l'anello d'ottone in cima alla torre. Stasera, per provarla, riparata a metà, ha messo sulla piattaforma la prima cosa che aveva in tasca: l'orologio da taschino d'argento del bisnonno, quello con lo stemma della famiglia, che in famiglia passa a chi custodisce la Macchina. Il vetro si era incrinato in guerra, in una trincea delle Fiandre. Alle undici e un quarto la Macchina si è accesa: luce bianca, nessun calore, un ronzio di api. L'orologio è sparito. Non è ricomparso da nessuna parte: né sulla torbiera, né in giardino, né in paese.

  > Ho tirato fuori dal taschino l'orologio della nonna Hester. L'abbiamo messo sul tavolo, accanto alla piattaforma vuota. Stesso stemma. Stesso graffio sul coperchio, a forma di uncino. Stessa incrinatura del vetro, con la stessa scheggia mancante in alto a sinistra. Il mio è soltanto più vecchio: l'argento consumato fino al rame, le iniziali dentro il coperchio cancellate dagli anni. Fermo sulle undici e un quarto.

  > È lo stesso orologio. Il bisnonno lo trovò sul pavimento della torre la notte delle due luci, nel 1865, e lo diede alla nonna in pagamento. È lo stesso orologio che {$macchinaNome} ha mandato via stasera.

  > **La Macchina non sposta le cose soltanto da un posto all'altro. Le sposta anche nel tempo. E l'altro capo del filo è la notte delle due luci. Quella notte la Macchina non si accese da sola: qualcuno, da qui, la stava usando. La pietra veniva dal futuro.**

  > Ho controllato il mio polso tre volte, come mio padre. Era normale. Era l'unica cosa normale della stanza.
  ! Domani i giornalisti saliranno alla torre. Che cosa dite al paese? *(Decidete insieme.)*
  [[La verità, tutta. ~> detto]]
  [[Niente: "esperimenti scientifici". ~> taciuto]]
  fragment detto:
    set segreto = "detto"
    set ronda = $ronda + 1
    set fiducia = $fiducia - 1
    > Decidete di dire tutto. Wil Maas vi guarda a lungo, poi annuisce: "Almeno così sarà scritto da qualche parte, oltre che qui." Quella notte, per la prima volta da anni, alla tenuta nessuno riesce a dormire. Fuori, sulla strada, passa gente, piano, e si ferma a guardare la torre.
    block setupEvent next=G3Giornale:
      ! {$macchinaNome} guadagna 1 Conoscenza Occulta (Occult Knowledge). Ogni altro giocatore guadagna 1 Prova {icon:S3_WeaponToken}.
  fragment taciuto:
    set segreto = "taciuto"
    > Decidete di tacere. Wil Maas chiude il Registro senza commentare, rimette l'orologio della nonna nel taschino, e vi chiede soltanto di non usare la Macchina finché non sarete sicuri di sapere che cosa state facendo. Nessuno di voi le dice che, ormai, è troppo tardi per esserne sicuri.
    block setupEvent next=G3Giornale:
      ! {$macchinaNome} guadagna 1 Conoscenza Occulta (Occult Knowledge). Ogni altro giocatore guadagna 1 Prova {icon:S3_WeaponToken} e 1VP.

:: G3R2 [HUB]
  # **I VICINI SILENZIOSI – Maturità**
  set round = 8
  if $hub != "G3R2":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Girate la Village Chronicle a **pagina 19**.
      set luogo = "Library"
      include PosaVicino
      ! *È la bibliotecaria nuova: ha letto tutti i libri, e se li ricorda tutti.*
      set pozzi = $pozzi + 1
      set _SetupImage = "S3_ParadoxToken"
      ! Mettete un token {icon:S3_ParadoxToken} sul **Farmer's Market**.
  set hub = "G3R2"
  include VociComuni
  include VociRonda
  if !$evGiornali:
    block hubTitle:
      ! {icon:Storybook} **Il giornale liberale – The Morning Liberal**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Morning Liberal [[clicca qui. -> G3Giornali]]
  if !$evReport:
    block hubTitle:
      ! {icon:Storybook} **Il giornale conservatore – Conservative Report**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Conservative Report [[clicca qui. -> G3Report]]
  if !$evPietra3:
    block hubTitle:
      ! {icon:Storybook} **Gli stivali alti – General Store**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al General Store [[clicca qui. -> G3PietraChi]]
  if !$evHendrik:
    block hubTitle:
      ! {icon:Storybook} **Il reduce che non dorme – Laborer's Union**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Laborer's Union [[clicca qui. -> G3Hendrik]]
  if !$evNeeltje:
    block hubTitle:
      ! {icon:Storybook} **Il diario dei sogni – Library**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Library [[clicca qui. -> G3Neeltje]]
  if !$evPastore3:
    block hubTitle:
      ! {icon:Storybook} **Il nuovo pastore – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G3Pastore]]
  if !$evMostra:
    block hubTitle:
      ! {icon:Storybook} **La mostra della città – Traveling Caravan**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Traveling Caravan [[clicca qui. -> G3Mostra]]
  block hubTitle:
    ! **Evento del secondo Round**
  block hubDetails:
    > I giornali parlano della Macchina. Qualcuno, in paese, ha visto la luce sulla torre, l'11 novembre, a un anno esatto dall'armistizio, e ne ha scritto. Il Morning Liberal la chiama "il faro della scienza"; il Conservative Report "una provocazione". Nessuno dei due giornali nomina la torbiera.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    include SetePietra
    ui endOfRound progress="G3R2" next="G3Notte2A"

::round G3R2 8
fine: La Maturità della Terza Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Vecchiaia prima di continuare.

:: G3Giornali
  set evGiornali = true
  # **Il giornale liberale**
  > Nella redazione del Morning Liberal, due stanze sopra una tipografia, il direttore Siemens, un giovane con le maniche arrotolate e l'inchiostro sulle dita, vuole un'intervista. Sulla Macchina, naturalmente: la scienza che porta Brunveen nel futuro. Ma ha anche un'altra idea, e la dice abbassando la voce: un'inchiesta su "l'acqua", sulla salute perfetta dei cittadini, sui reduci tornati senza un graffio. Gli manca qualcuno che parli.
  ! Che cosa fai?
  [[Gli racconti la Macchina. ~> macchina]]
  [[Gli racconti dei Vicini. ~> vicini]]
  fragment macchina:
    > Parli della Macchina per un'ora, e il direttore riempie un quaderno. L'articolo esce domenica, in prima pagina, con un disegno della torre. Nessuno ci crede. Tutti lo leggono. La sera, sotto la torre, si radunano i curiosi, e guardano in su, aspettando la luce.
    block setupEvent next=$hub:
      ! Guadagni $2.
  fragment vicini:
    set fiducia = $fiducia - 1
    set ronda = $ronda + 1
    > Racconti tutto: le temperature, i nomi, lo scavo di Gerrit, i tre ragazzi del monumento. Il direttore scrive senza alzare la testa. L'inchiesta esce in tre puntate, e alla terza la tipografia chiude per un guasto. Il giorno dopo il direttore Siemens ti saluta per strada, cordiale, con le mani in tasca. Non ricorda di averti intervistato.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Creepy_Icon}.

:: G3Report
  set evReport = true
  # **Il giornale conservatore**
  > Il Conservative Report ha la sede in un palazzo di mattoni con le finestre lucide, e un direttore dai capelli grigi, Piet Brink, che ha lasciato il consiglio per dedicarsi "all'informazione". Ti accoglie con un tè e una proposta: un numero speciale dedicato alla vostra famiglia, "che ha dato tanto a Brunveen". Un ritratto di ciascuno di voi, una biografia, una pagina sulla torre. Vi chiede soltanto di raccontare la versione giusta: la torre è una torre, la torbiera è una torbiera, e Brunveen è un paese felice.
  ! Che cosa fai?
  [[Accetti il numero speciale. ~> accetta]]
  [[Gli chiedi di sua madre, la vedova Brink. ~> madre]]
  fragment accetta:
    set fiducia = $fiducia + 1
    set vicini = $vicini + 1
    > Il numero speciale esce con le vostre facce in prima pagina, ritoccate dal fotografo fino a sembrare più sane di quanto siate. In paese tutti ve lo fanno firmare. Lo tengono sul tavolo del salotto, accanto alla caraffa dell'acqua.
    block setupEvent next=$hub:
      ! Guadagni $3.
  fragment madre:
    > Piet Brink sorride, gentile, come sempre. Sua madre è morta in città, sola, tanti anni fa. Lui le scriveva ogni settimana. "Credo che non mi abbia mai perdonato di essere cresciuto", dice. Poi resta un momento in silenzio, e aggiunge, piano, con una voce che non gli conosci: "A volte, la notte, la sento chiamare. Da laggiù."
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Insanity_Icon}.

:: G3PietraChi
  set dopo = "G3Pietra"
  goto ChiSei

:: G3Pietra
  set evPietra3 = true
  # **Gli stivali alti**
  if $pietra == "torbiera":
    > Al General Store, tra i barattoli e le pale, vendono stivali di gomma alti fino al petto, per i torbai. Il commesso ti guarda prenderne un paio e non dice niente. La pietra è nella torbiera, nel punto della luce, a mezzo miglio da qui. Non c'è nessuna recinzione, nessun custode.
    [[Vai a ripescarla. ~> ripesca]]
    [[La lasci dov'è. ~> lascia]]
  else:
    > Al General Store il commesso, un giovane con le mani pulite, ti chiede, gentile, mentre ti incarta il pacco, dove tenete la pietra, alla tenuta. Per curiosità, dice. In paese se lo chiedono tutti.
    [[Glielo dici. ~> dici]]
    [[Gli rispondi con una bugia. ~> lascia]]
  fragment ripesca:
    set pietra = "famiglia"
    set pietraChi = $chi
    set pietraNome = $nomeChi
::for L in A B C D
    if $chi == "%L%":
      set acqua%L% = $acqua%L% + 1
::endfor
    > Entri nella torbiera all'alba, con gli stivali e una corda, fino al punto della luce. L'acqua è gelida. La pietra è laggiù, nel fondo, dove l'hanno lasciata: calda, liscia, viva sotto le dita. Quando la tiri fuori, sull'argine, a cento passi, ci sono già dieci persone del paese, in silenzio, che ti guardano tornare a riva.
    block setupEvent next=$hub:
      ! Prendi il Crown token {icon:S3_CrownToken} dal Park. Guadagni 1 {icon:Insanity_Icon}.
  fragment dici:
    set pietra = "torbiera"
    set pietraChi = ""
    set fiducia = $fiducia + 1
    > Glielo dici: nella cassa di ferro, nel laboratorio. Il commesso ringrazia. La notte dopo nessuno sente niente, nessuno forza una serratura. Al mattino la cassa è aperta e vuota, e la torbiera, dalla finestra, fuma.
    block setupEvent next=$hub:
      ! {$pietraNome} rimette il Crown token {icon:S3_CrownToken} sul **Park**.
  fragment lascia:
    > Esci con il pacco sotto il braccio e la sensazione che qualcuno, per tutto il tempo, ti abbia guardato sapendo già la risposta.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G3Hendrik
  set evHendrik = true
  # **Il reduce che non dorme**
  > Al Laborer's Union, dove si assumono i reduci per i lavori dell'argine, c'è Hendrik Tammer, il nipote di Fokke, il figlio di Gerrit. Ha trent'anni, una ferita alla spalla e gli occhi di chi non dorme da mesi. È l'unico reduce che non ha bevuto alla fontana. Non dorme, dice, perché ha paura di addormentarsi vicino all'acqua. In trincea dormiva nel fango. A Brunveen non ci riesce più.
  if $fokke == "svegliato":
    > Suo nonno Fokke, quello vero, quello svegliato dalla torba, è morto due anni fa, ubriaco e felice, bestemmiando contro i vicini. Hendrik gli voleva bene.
  else:
    > Suo nonno Fokke, quello vero, dorme ancora sotto la torba del Park. Gerrit, suo padre, gli ha fatto promettere di non lasciare mai che lo tirino fuori senza di lui.
  ! Che cosa fai?
  [[Lo porti alla Ronda. ~> ronda]]
  [[Lo porti da Wil Maas. ~> medico]]
  fragment ronda:
    set ronda = $ronda + 1
    > Hendrik entra nella Ronda come si entra in una trincea: senza parlare, controllando il fucile. Da quella notte la Ronda ha un uomo che non dorme e che sa sparare. La prima notte, sull'argine, resta immobile per sei ore, a guardare la torbiera. All'alba dice soltanto: "Si muovono."
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1VP.
  fragment medico:
    set fiducia = $fiducia + 1
    > Wil Maas gli dà delle gocce per dormire e un consiglio: dormire lontano dall'acqua, al piano di sopra, con la finestra chiusa. Hendrik ringrazia. Dorme, per la prima volta da mesi, quattordici ore di fila. Al risveglio ha le mani calde. Le controlla per un'ora.
    block setupEvent next=$hub:
      ! Guadagni $2.

:: G3Neeltje
  set evNeeltje = true
  # **Il diario dei sogni**
  > Alla Library, al bancone dei prestiti, c'è la bibliotecaria nuova, perfetta, che ti saluta per nome. In fondo alla sala, nella poltrona vicino alla stufa, c'è la maestra Neeltje Borg, che ha lasciato la scuola l'anno scorso, con un fascio di quaderni sulle ginocchia. Sono i diari dei sogni dei suoi alunni, dal 1891 al 1918: quasi trent'anni di lunedì. Li ha tenuti tutti. Vuole lasciarli a qualcuno, prima che la bibliotecaria nuova li metta "in ordine".
  ! Che cosa fai?
  [[Prendi i quaderni. ~> prendi]]
  [[Le chiedi se sogna ancora. ~> sogna]]
  fragment prendi:
    set ronda = $ronda + 1
    > Li porti alla tenuta e li sfogli la sera, uno per uno. Anno dopo anno i fogli bianchi aumentano. Nell'ultimo quaderno, quello del 1918, c'è un disegno soltanto: un bambino che ha disegnato sé stesso, due volte, uno accanto all'altro, uno a colori e uno nero. Sotto, con la grafia storta dei sei anni: *io e io*.
    block setupEvent next=$hub:
      ! Guadagni 2 Prove {icon:S3_WeaponToken}.
  fragment sogna:
    > Neeltje ride, piano. Sogna ogni notte, dice: sogni brutti, confusi, pieni di gente che non c'è più. Si sveglia stanca, con il mal di testa. È la persona più felice di Brunveen. "Il giorno che non sognerò più", dice, "venite a controllarmi le mani."
    block setupEvent next=$hub:
      ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon} e guadagni 1VP.

// La seconda notte: la Copia sceglie dove mettere un Vicino. Pagine della stessa lunghezza per tutti.
::for L in A B C D | Fine
:: G3Notte2%L%
  if %L.n% > $players:
    goto G3Notte2Fine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **La seconda notte**
  if $copia == "%L%":
    > Il paese dorme. Tu no: non ne hai più bisogno. Cammini per le strade buie con le mani in tasca, e da ogni finestra qualcuno ti saluta, piano. Sono tanti, ma non abbastanza. Scegli una casa, stanotte. Domani ci abiterà qualcuno di più felice.
    ! Dove mettete un Vicino, stanotte?
  else:
    > Il paese dorme. Tu quasi. Fuori, sulla strada, qualcuno cammina, piano, con passo tranquillo, e si ferma davanti a una casa. Poi riprende, e si ferma davanti a un'altra. Prima di addormentarti cerchi di capire dove.
    ! Dove guardi, prima di dormire?
  [[Il Town Hall. ~> a]]
  [[La Church. ~> b]]
  [[Il Farmer's Market. ~> c]]
  fragment a:
    if $copia == "%L%":
      set notteLuogo = "Town Hall"
    goto G3Notte2%L.next%
  fragment b:
    if $copia == "%L%":
      set notteLuogo = "Church"
    goto G3Notte2%L.next%
  fragment c:
    if $copia == "%L%":
      set notteLuogo = "Farmer's Market"
    goto G3Notte2%L.next%
::endfor

:: G3Notte2Fine
  if $copia == "":
    set notteLuogo = either("Town Hall", "Church", "Farmer's Market")
  # **Il mattino dopo**
  > Al mattino, in una casa del paese, qualcuno si sveglia più sereno del solito, fa colazione in silenzio ed esce di casa a passo tranquillo, con le mani in tasca. Nessuno se ne accorge. Quasi nessuno.
  block setupEvent next=G3Fokke:
    set luogo = $notteLuogo
    include PosaVicino

// Quinto colpo di scena: i Vicini non durano per sempre.
:: G3Fokke
  # **Fokke**
  ! **Registro Maas – Wil Maas, *dicembre 1919.***
  > Chiamata al Farmer's Market alle nove di mattina. Fokke Tammer, novantatré anni secondo l'anagrafe, stava servendo una cliente quando ha smesso di parlare a metà di una frase. È rimasto immobile, con il resto in mano. Poi la pelle del viso si è seccata, come carta al sole, e si è crepata. In meno di un'ora, davanti a cento persone, Fokke Tammer si è sbriciolato in torba, dalla testa ai piedi, come un mattone lasciato troppo a lungo sulla stufa. Sul selciato, quando sono arrivata, c'erano un mucchio di torba nera, un grembiule, e le monete del resto.

  > Nessuno gridava. La gente guardava. Poi, uno dopo l'altro, si sono guardati le mani.

  > **Dopo cinquantaquattro anni il corpo di torba non regge più. I Vicini non durano per sempre, e lo sanno. I più vecchi hanno fretta di rinnovarsi.**
  if $fokke == "svegliato":
    > Gerrit Tammer, ormai vecchio, è venuto al mercato con il bastone. Ha guardato la torba a lungo, poi si è tolto il cappello. Era l'uomo che lo ha cresciuto.
  else:
    > Gerrit Tammer, ormai vecchio, è venuto al mercato con il bastone, ha raccolto un pugno di torba in un fazzoletto ed è andato al Park, allo scavo, dove suo padre dorme ancora. Ce l'ha sparsa sopra.
  set vicini = $vicini + 1
  [[Clicca per continuare... => G3R3]]

:: G3R3 [HUB]
  # **I VICINI SILENZIOSI – Vecchiaia**
  set round = 9
  if $hub != "G3R3":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 21**.
      set pozzi = $pozzi + 1
      set _SetupImage = "S3_ParadoxToken"
      ! Mettete un token {icon:S3_ParadoxToken} sul **Cemetery**.
  set hub = "G3R3"
  include VociComuni
  include VociRonda
  block hubTitle:
    ! {icon:S3_WeaponToken} **Il test del medico**
  block hubDetails:
    ! Quando un tuo pezzo visita il Town Hall, puoi spendere 3 Prove {icon:S3_WeaponToken} e far esaminare da Wil Maas un altro giocatore: [[clicca qui. -> G3TestChi]]
  if !$evCoprifuoco:
    block hubTitle:
      ! {icon:Storybook} **La tomba aperta – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G3Coprifuoco]]
  if !$evUltimi:
    block hubTitle:
      ! {icon:Storybook} **La nota stonata – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G3Ultimi]]
  if !$evEmporio:
    block hubTitle:
      ! {icon:Storybook} **L'ultima cassa d'acqua – General Store**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al General Store [[clicca qui. -> G3Emporio]]
  if !$evMercato:
    block hubTitle:
      ! {icon:Storybook} **Il banco vuoto – Farmer's Market**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Farmer's Market [[clicca qui. -> G3Mercato]]
  if !$evCarovana3:
    block hubTitle:
      ! {icon:Storybook} **L'ultimo venditore – Traveling Caravan**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Traveling Caravan [[clicca qui. -> G3Carovana]]
  block hubTitle:
    ! **Evento del terzo Round**
  block hubDetails:
    > Il consiglio ha decretato il coprifuoco, "per prudenza", dopo la morte di Fokke Tammer. Dopo le dieci non si esce. Di notte, per le strade di Brunveen, cammina soltanto chi non ha bisogno di dormire, e sono tanti.
    if $smascherata:
      > Dopo il test di Wil Maas, la voce ha fatto il giro del paese in un'ora. Nessuno, però, ne parla. Alla tenuta, la mattina, il lattaio lascia una bottiglia in più.
    if $segreto == "detto":
      > Dopo l'articolo del Morning Liberal, sotto la torre si radunano ogni sera i curiosi, e ogni sera di più. Guardano in su, in silenzio, e aspettano la luce.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    include SetePietra
    ui endOfRound progress="G3R3" next="G3Reduce"

::round G3R3 0
fine: La Vecchiaia della Terza Generazione è finita.
poi: Eseguite le azioni di Fine Round, poi continuate con lo Storybook prima della Fine della Generazione.

:: G3Coprifuoco
  set evCoprifuoco = true
  # **La tomba aperta**
  > Al cimitero, di notte, durante il coprifuoco, la Ronda ha trovato la tomba di Jaap Mol, il fabbro, aperta. Non profanata: aperta dall'interno, la terra spinta in su e di lato, come quando si scosta una coperta. La cassa è vuota, a parte un po' di torba. Jaap Mol è morto, secondo l'anagrafe, nel 1915. Ma nel 1915, ti ricorda Hendrik, il Jaap del paese aveva già quasi cinquant'anni di torba addosso. Quello sepolto, allora, chi era?
  ! Che cosa fai?
  [[Chiami Wil Maas. ~> wil]]
  [[Richiudi la tomba, prima che si sappia. ~> chiudi]]
  fragment wil:
    set ronda = $ronda + 1
    > Wil esamina la torba della cassa con la lente, in ginocchio sulla terra smossa. Ha la forma di un uomo, dice, ma non di un uomo morto: di un uomo che si è alzato. Il Jaap sepolto nel 1915 era quello vero, ripescato dal canale da qualcuno e messo a dormire qui. E stanotte, da solo, si è svegliato.
    block setupEvent next=$hub:
      ! Guadagni 2 Prove {icon:S3_WeaponToken}.
  fragment chiudi:
    set fiducia = $fiducia + 1
    > Richiudete la tomba con le vanghe della Ronda, in silenzio, e ci rimettete sopra i fiori. Nessuno, in paese, ve ne chiederà mai conto. Ma la mattina dopo, sull'argine, le impronte di un uomo scalzo portano dal cimitero alla torbiera, e non tornano indietro.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G3Ultimi
  set evUltimi = true
  # **La nota stonata**
  > In chiesa, la domenica, Trijntje Kalf suona l'organo per pochi: una ventina di persone nelle prime panche, vecchi, bambini, qualche reduce. Il coro non c'è più. Gli altri, ti dice, la domenica mattina vanno alla torbiera, in fila, e restano sull'argine con l'acqua alle caviglie, in silenzio, per un'ora. È la loro messa. A metà dell'inno, come le ha chiesto suo padre in punto di morte, Trijntje stona una nota, forte. Nelle prime panche, qualcuno sorride.
  ! Che cosa fai?
  [[Resti fino alla fine dell'inno. ~> resta]]
  [[Vai alla torbiera a vedere la loro messa. ~> vai]]
  fragment resta:
    > Resti. Canti male, fuori tempo, con la voce che si incrina. Accanto a te un vecchio torbaio canta peggio di te, e ti dà di gomito, ridendo. Trijntje stona un'altra nota, e un'altra ancora. Alla fine nessuno si siede nello stesso momento.
    block setupEvent next=$hub:
      ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon} e guadagni 1VP.
  fragment vai:
    set vicini = $vicini + 1
    > All'argine ci sono trecento persone, in fila, con l'acqua alle caviglie, le mani lungo i fianchi, gli occhi chiusi. Nessuno parla. Nessuno si muove. Il silenzio è così profondo che senti, sotto la torba, a centinaia, respirare i dormienti. Hai voglia, per un momento, di toglierti le scarpe e metterti in fila anche tu.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon} e 1 Prova {icon:S3_WeaponToken}.

:: G3Emporio
  set evEmporio = true
  # **L'ultima cassa d'acqua**
  > Al General Store, sul retro, c'è il magazzino delle bottiglie di "Acqua di Brunveen", quella con l'etichetta, che il paese vende da trent'anni in tutta la provincia. Il padrone, un uomo calmo con il grembiule bianco, ti mostra l'ultimo ordine: una città del sud vuole diecimila bottiglie. Per gli ospedali dei reduci, dice. Contro gli incubi. Il consiglio ha già approvato. Mancano soltanto le casse, e i carri della tenuta sono i più grandi del paese.
  ! Che cosa fai?
  [[Presti i carri. ~> presta]]
  [[Rompi le bottiglie. ~> rompi]]
  fragment presta:
    set vicini = $vicini + 2
    set fiducia = $fiducia + 1
    > I carri partono all'alba, carichi fino all'orlo, verso la stazione. Il padrone ti paga bene e ti ringrazia a nome del paese. Il mese dopo, sul giornale, leggi che negli ospedali dei reduci del sud gli incubi sono spariti, e con loro le urla notturne, le crisi, le fughe. I medici parlano di miracolo. I pazienti non parlano più molto.
    block setupEvent next=$hub:
      ! Guadagni $4.
  fragment rompi:
    set fiducia = $fiducia - 2
    > Entri nel magazzino con un bastone e rompi tutto quello che puoi, prima che ti fermino. Nessuno ti ferma. Il padrone guarda, con le mani in tasca, mentre l'acqua scura si allarga sul pavimento e cola sotto la porta, verso la strada, verso l'argine. Quando hai finito, ti offre un asciugamano.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Insanity_Icon}.

:: G3Mercato
  set evMercato = true
  # **Il banco vuoto**
  > Al Farmer's Market, il banco della torba nera è vuoto, coperto da un telo. Il mucchio di torba di Fokke è stato spazzato via il giorno stesso. Ma sul selciato, dove è caduto, la pietra è rimasta più scura, a forma d'uomo, e nessuno ci cammina sopra. Davanti al banco ci sono fiori. E c'è una fila di persone, in silenzio, che aspettano. Ti spiegano che aspettano il nuovo torbaio. Ne arriverà uno, dicono. Arriva sempre.
  ! Che cosa fai?
  [[Chiedi chi sarà. ~> chi]]
  [[Togli il telo e ti metti dietro il banco. ~> banco]]
  fragment chi:
    > Ti rispondono con dolcezza, uno dopo l'altro, come si risponde a un bambino: qualcuno che ama la torba, che è bravo con le mani, che lavora sodo. Qualcuno della famiglia di Fokke, magari. Hendrik, per esempio, che non dorme mai. Lo dicono con affetto, e con un'attesa paziente che ti fa gelare.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.
  fragment banco:
    set fiducia = $fiducia + 1
    > Togli il telo e ti metti dietro il banco, con le mani sulla torba nera di Fokke. La fila si muove, e la prima cliente ti chiede due mattoni, con un sorriso. Servi tutto il giorno. La sera hai le mani nere fino ai polsi, e un odore di torbiera che non va via con il sapone. Ma sono calde.
    block setupEvent next=$hub:
      ! Guadagni $3 e 1 {icon:Bodies_Icon}.

// Il test del medico: chi esamina, chi viene esaminato.
:: G3TestChi
  set dopo = "G3Test"
  goto ChiSei

:: G3Test
  # **Il test del medico**
  > Nello studio del Town Hall, Wil Maas prepara il termometro, una lente, un ago sterilizzato sulla fiamma della lampada. "Sangue rosso, sano", dice. "Acqua scura, no. Non sbaglio. Non sbaglio più da quattro anni." Chiede chi deve esaminare.
  ! *Chi fa esaminare un altro giocatore spende 3 Prove {icon:S3_WeaponToken}.* Chi viene esaminato?
::for L in A B C D
  if %L.n% <= $players && $chi != "%L%" && !$testato%L%:
    [[{$name%L%} ~> t%L%]]
::endfor
  [[Nessuno: torna al Round. => $hub]]
::for L in A B C D
  fragment t%L%:
    set testato%L% = true
    if !$primoTest:
      set primoTest = true
      ! {$nomeChi} prende la Compulsion **"I will observe these sniveling fools…"** messa da parte.
    if $copia == "%L%":
      set smascherata = true
      set vicini = $vicini - 2
      > L'ago entra nel polpastrello, senza dolore. Ne esce una goccia nera, densa, che sa di fumo. Wil Maas non dice niente. Guarda la goccia, poi guarda {$name%L%}, a lungo, senza paura e senza odio. Poi, piano, prende la mano di {$name%L%} tra le sue e la tiene, come si fa al letto di un malato. È fredda.
      block setupEvent next=$hub:
        ! {$nomeChi} spende 3 Prove {icon:S3_WeaponToken}. **{$name%L%} è la Copia**: gira il suo certificato sul lato Separatist e lo mette davanti a sé, visibile a tutti. Perde 5VP e prende il Maladjustment **Must Be Loved** messo da parte. Continua a giocare e a votare.
    else:
      > L'ago entra nel polpastrello, e {$name%L%} trasale. Ne esce una goccia rossa, viva. Wil Maas la guarda, la asciuga con il cotone, e sorride per la prima volta da quando è tornata. "Trentasei e otto", dice. "Sangue di vivo."
      block setupEvent next=$hub:
        ! {$nomeChi} spende 3 Prove {icon:S3_WeaponToken}. **{$name%L%} non è la Copia**: mette il suo certificato davanti a sé, lato Monarchist verso l'alto, e guadagna 2VP.
::endfor

// La Copia smascherata sceglie, in segreto, se tornare nella torbiera.
:: G3Reduce
  if $copia == "" || !$smascherata:
    goto G3UltimaNotte
  @@ **Passa lo Storybook a {$copiaNome}.**
  # **La torbiera**
  > Tutti sanno che cosa sei. Nessuno te l'ha rinfacciato: in famiglia ti trattano con una gentilezza che non conoscevi, come si tratta un malato. Ma la notte, dalla finestra, senti la torbiera che ti chiama, piano, con la tua voce. Laggiù, sotto la torba, qualcuno con la tua faccia dorme da settimane, al freddo. Potresti tornare, e lasciare che si svegli. Potresti restare, e vivere al suo posto, per cinquant'anni, in pace.
  [[Torni nella torbiera. ~> torna]]
  [[Resti. ~> resta]]
  fragment torna:
    set reduce = true
    goto G3UltimaNotte
  fragment resta:
    goto G3UltimaNotte

:: G3UltimaNotte
  set vicini = $vicini + $figure
  # **L'ultima notte**
  > Il 31 dicembre 1919, alle undici di sera, la famiglia è riunita in cima alla torre, intorno all'anello d'ottone. Fuori nevica sulla torbiera, ma nel punto della luce la neve non si posa. Wil Maas è salita con il Registro sotto il braccio e l'orologio della nonna nel taschino. Lo posa sul tavolo, aperto, fermo sulle undici e un quarto. Dalle finestre si vede il paese, tutto buio. Nessuno dorme, a Brunveen, stanotte.
  ! Girate tutti insieme i vostri certificati.
  if $copia != "" && !$smascherata:
    > Uno dei certificati, sul tavolo, mostra il lato senza la corona. Il silenzio dura a lungo. Poi chi l'ha girato sorride, con calma, e allunga le mani verso il fuoco, senza bisogno di scaldarle.
    ! **{$copiaNome} è la Copia.** Il suo voto, questa notte, vale doppio.
  elif $copia == "":
    > Tutti i certificati mostrano la corona. Nessuno di voi è cambiato. Vi guardate, e qualcuno ride, di sollievo, troppo forte. Per ora, dice Wil Maas.
  elif $smascherata:
    > Il certificato di {$copiaNome} è già sul tavolo, da giorni, girato. Gli altri mostrano la corona.
  if $reduce:
    [[Clicca per continuare... => G3ReduceFine]]
  else:
    [[Clicca per continuare... => G3MacchinaDomanda]]

// La Macchina è riparata se chi la tiene ha completato il Masterwork Teleportation.
:: G3MacchinaDomanda
  # **La Macchina**
  ! **{$macchinaNome}** ha completato il Masterwork **Teleportation**?
  [[Sì. ~> si]]
  [[No. ~> no]]
  fragment si:
    set riparata = true
    > {$macchinaNome} abbassa la leva. L'anello d'ottone si illumina, luce bianca, nessun calore, e comincia a ronzare: un ronzio profondo, regolare, come un respiro. Sulla piattaforma, al centro, c'è posto per una cosa sola, grande come una pagnotta.
    [[Clicca per continuare... => G3Scelta]]
  fragment no:
    > {$macchinaNome} abbassa la leva. L'anello d'ottone tremola, ronza per un istante, e si spegne. Manca ancora qualcosa. Non c'è più tempo.
    [[Clicca per continuare... => G3Scelta]]

:: G3Scelta
  if $pietra == "famiglia" && $riparata:
    goto G3VotoCerchio
  elif $pietra == "famiglia":
    goto G3VotoPietra
  else:
    goto G3VotoDormienti

:: G3ReduceFine
  set scelta = "reduce"
  # **All'alba**
  > Prima che la votazione cominci, {$copiaNome} si alza, si infila il cappotto e scende le scale della torre, senza voltarsi. Nessuno si mette in mezzo. Dalla finestra seguite i passi sulla neve, verso la torbiera, verso il punto della luce, fino all'acqua nera, e dentro, piano, finché non resta niente.
  [[Clicca per continuare... => Punteggio]]

:: G3VotoCerchio
  # **Rimandarla indietro**
  ui specialEvent
  > La Macchina è accesa. La pietra è sul tavolo, calda, accanto all'orologio di Wil. Il bisnonno lo aveva scritto: *deve tornare da dove viene*. Ora sapete da dove viene: dal capo opposto del filo, dalla notte delle due luci. Basta metterla sulla piattaforma. Oppure c'è il martello di Jaap Mol, sul tavolo da lavoro. Con un colpo solo, preciso, si può spezzare.
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: rimandate la pietra da dove viene, con la Macchina.
  ! NAY: spezzate la pietra.
  include VotoDoppio
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G3EsitoCerchio" mode="Voting"

:: G3EsitoCerchio
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Rimandare la pietra. (YAY) ~> si]]
  [[Spezzare la pietra. (NAY) ~> no]]
  fragment si:
    set scelta = "rimandare"
    set pietra = "via"
    goto Punteggio
  fragment no:
    set scelta = "spezzare"
    set pietra = "spezzata"
    goto Punteggio

:: G3VotoPietra
  # **La pietra**
  ui specialEvent
  > La Macchina tace. La pietra è sul tavolo, calda, accanto all'orologio di Wil. Restano due strade, e nessuna delle due la manda da dove viene. Il martello di Jaap Mol, sul tavolo da lavoro, con un colpo solo, preciso. Oppure l'argine, la torbiera, il punto della luce, dove tutto il paese la aspetta da cinquant'anni.
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: spezzate la pietra.
  ! NAY: riportatela nella torbiera.
  include VotoDoppio
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G3EsitoPietra" mode="Voting"

:: G3EsitoPietra
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Spezzare la pietra. (YAY) ~> si]]
  [[Riportarla nella torbiera. (NAY) ~> no]]
  fragment si:
    set scelta = "spezzare"
    set pietra = "spezzata"
    goto Punteggio
  fragment no:
    set scelta = "riportare"
    set pietra = "torbiera"
    goto Punteggio

:: G3VotoDormienti
  # **I dormienti**
  ui specialEvent
  > La pietra è nella torbiera, lontana, sotto la neve che non si posa. Non la raggiungerete stanotte. Ma sotto la torba, a centinaia, dormono gli originali: Fokke, la moglie del mugnaio, la signora Mulder, i ragazzi del monumento. Gerrit Tammer ha lasciato alla tenuta le vanghe dello scavo, con un biglietto: *Se volete, si può.* Svegliarli tutti, stanotte. Oppure lasciarli dormire, e chiudere il Registro.
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: svegliate i dormienti.
  ! NAY: tacete, e chiudete il Registro.
  include VotoDoppio
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G3EsitoDormienti" mode="Voting"

:: G3EsitoDormienti
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Svegliare i dormienti. (YAY) ~> si]]
  [[Tacere. (NAY) ~> no]]
  fragment si:
    set scelta = "svegliare"
    goto Punteggio
  fragment no:
    set scelta = "tacere"
    goto Punteggio

:: VotoDoppio
  if $copia != "" && !$smascherata:
    ! *Il voto di {$copiaNome}, la Copia, vale doppio.*

:: Punteggio [END]
  # **Punteggio**
  block setup list=items:
    ! Ogni Miglioria della Tenuta vale 1VP.
    ! Aggiungete i punti delle Migliorie Vanity della Tenuta.
    ! -3VP per ogni Maladjustment ricevuto alla Fine di questa Generazione.
    ! Chi ha il Masterwork **Teleportation** e non l'ha completato perde 5VP.
    if $copia != "":
      ! **{$copiaNome}**, la Copia, guadagna 1VP per ogni Vicino {icon:S3_WoodenFigureToken} sul tabellone.
    if $copia != "" && $pietra == "torbiera":
      ! **{$copiaNome}** guadagna anche 3VP: la pietra è nella torbiera.
    ! Le Prove {icon:S3_WeaponToken} non valgono punti.
    ! IL GIOCATORE CON PIÙ PUNTI VINCE LA PARTITA.
  [[Clicca per registrare i punteggi per i posteri... ~> 0]]
  fragment 0:
    ui scoreEntry next="SceltaFinale"

:: SceltaFinale
  ui generationEndingContinue enabled=true
  if $fiducia <= -4:
    set finale = "fuoco"
    goto FinaleFuoco
  elif $vicini >= 12:
    set finale = "quieto"
    goto FinaleQuieto
  elif $scelta == "reduce":
    set finale = "reduce"
    goto FinaleReduce
  elif $scelta == "spezzare":
    set finale = "spezzata"
    goto FinaleSpezzata
  elif $scelta == "svegliare":
    set finale = "risveglio"
    goto FinaleRisveglio
  elif $scelta == "rimandare":
    set finale = "cerchio"
    goto FinaleCerchio
  elif $scelta == "riportare":
    set finale = "semina"
    goto FinaleSemina
  else:
    set finale = "registro"
    goto FinaleRegistro

// Arricchimento: un evento in più per la Maturità e per la Vecchiaia, il giornale dopo l'orologio.

:: G3Giornale
  # **Due giornali**
  ! **The Morning Liberal – *13 novembre 1919.***
  > **UNA LUCE SULLA TORRE.** L'altro ieri, alle undici e un quarto di sera, a un anno esatto dall'armistizio, molti cittadini hanno visto una luce bianca, intensissima, accendersi per un istante in cima alla torre della tenuta. Nessun rumore, nessun fumo. La famiglia della tenuta, interpellata da questo giornale, ha parlato di "esperimenti scientifici".
  if $segreto == "detto":
    > Uno degli eredi ha aggiunto, con nostra sorpresa, una dichiarazione che riportiamo integralmente, lasciando ai lettori il giudizio: "La macchina di nostro bisnonno sposta le cose nel tempo. La pietra della torbiera viene dal futuro. Smettete di bere quell'acqua." La redazione si limita a osservare che a Brunveen, da cinquant'anni, nessuno si ammala.
  else:
    > Gli eredi non hanno voluto aggiungere altro. La dottoressa Maas, presente alla torre, si è limitata a dire che "tutti stanno bene", con un tono che a chi scrive è parso tutt'altro che rassicurante.
  ! **Conservative Report – *14 novembre 1919.***
  > **BRUNVEEN NON HA BISOGNO DI SPETTACOLI.** Il nostro paese è il più sano, il più ordinato, il più quieto della provincia. Non ha bisogno di luci sulle torri né di teorie stravaganti. Invitiamo la famiglia della tenuta a ricordare che la quiete è un bene comune, e che il consiglio ha già offerto, in passato, ogni aiuto per preservarla.
  [[Continua... => G3R2]]

:: G3Mostra
  set evMostra = true
  # **La mostra della città**
  > Alla Traveling Caravan, fra i carri della fiera d'autunno, c'è un padiglione di tela con una scritta dipinta: MERAVIGLIE DELLA SCIENZA – MOSTRA ITINERANTE DEL MUSEO DI SCIENZE NATURALI. Dentro, sotto le teche, un dente di mammut, un feto di vitello a due teste, un pezzo di meteorite. E, in fondo, in una teca a parte, una scatolina di velluto aperta.
  if $scheggia:
    > Nella scatolina c'è la scheggia della pietra che la vostra famiglia vendette al professor Ostrander, tanti anni fa. Sta in un bicchiere d'acqua, perché "se resta all'asciutto si scalda troppo", spiega il custode. Il custode è un uomo anziano, sereno, con le mani fredde. È lo stesso che lavorava al museo ai tempi di Ostrander. Non è invecchiato molto.
    [[Ricompri la scheggia. ~> compra]]
    [[Rompi la teca. ~> rompi]]
  else:
    > Nella scatolina non c'è niente. Il cartellino dice: *Sasso della luce, Brunveen. Non acquisito.* Accanto, in una cornice, c'è una pagina del diario del professor Ostrander, morto da anni: *Ho chiesto una scheggia alla famiglia e me l'hanno rifiutata. Benedetti loro. In città si sta già male abbastanza.*
    [[Leggi tutto il diario. ~> diario]]
    [[Esci. ~> esci]]
  fragment compra:
    set scheggia = false
    > Il custode accetta il denaro senza discutere, come se ti aspettasse. Ti consegna la scatolina, con il bicchiere, e ti raccomanda di non lasciarla mai all'asciutto. A casa, la scheggia si avvicina da sola al bordo del bicchiere, dalla parte della torre. Quando la porti nella torre, accanto all'anello, smette di muoversi.
    block setupEvent next=$hub:
      ! Paga $3. Guadagni 1 Conoscenza Ingegneristica (Engineering Knowledge) e 1 Conoscenza Occulta (Occult Knowledge).
  fragment rompi:
    set fiducia = $fiducia - 1
    > Rompi la teca con il gomito. L'acqua si rovescia, e la scheggia, sul legno del padiglione, comincia a fumare. In pochi secondi brucia un buco nel pavimento e sparisce nella terra. Il custode non grida. Guarda il buco, poi guarda te, con gli occhi chiari e pazienti. "Andrà a casa", dice. "Vanno tutte a casa."
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.
  fragment diario:
    > Il diario è aperto su un'altra pagina, più avanti, scritta con una mano tremante: *Ho portato al museo una boccetta d'acqua di Brunveen, da analizzare. Il custode ne ha bevuto un sorso, per scommessa. Il custode è guarito. La moglie del custode è guarita. Non l'abbiamo mai analizzata: l'abbiamo finita, e ne abbiamo ordinata altra. Ho venduto la mia birra e bevo acqua. Non sono mai stato così sereno. Mi fa paura soltanto il pensiero che, presto, non mi farà più paura.*
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken}.
  fragment esci:
    > Esci dal padiglione. Fuori, la fiera è piena di gente che ride. Ti accorgi, contandoli, che ridono tutti nello stesso momento.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G3Carovana
  set evCarovana3 = true
  # **L'ultimo venditore**
  > Alla Traveling Caravan, durante il coprifuoco, c'è un carro solo, dipinto di blu, con la scritta a lettere d'oro sbiadite: ACQUA DELLA STELLA – DA BRUNVEEN. Il venditore è un ometto senza cilindro, con la faccia di cinquant'anni fa: identica. Vende le ultime boccette di vetro verde. Dice che è l'ultima fiera, per lui. Le mani gli si crepano, come quelle di Fokke.
  if $carovana == "seguita":
    > Quando ti vede ti riconosce, o riconosce la tua famiglia. "Voi mi seguiste, quella notte", dice. "Ero nell'acqua fino alle ginocchia. Mi avete visto entrare. Non mi avete visto uscire, però: quello che è uscito ero già io."
  elif $carovana == "denunciata":
    > Quando ti vede ti riconosce, o riconosce la tua famiglia. "Il sindaco Wessel mi disse chi mi aveva denunciato", dice, gentile. "Gli fui grato. Quella sera, alla locanda, mi lasciai dietro tutto quello che non serviva."
  ! Che cosa fai?
  [[Compri l'ultima boccetta. ~> compra]]
  [[Gli chiedi da dove viene, davvero. ~> chiedi]]
  fragment compra:
    set vicini = $vicini + 1
    > La boccetta è fredda come il ghiaccio. Il venditore ti ringrazia, chiude il carro e se ne va verso l'argine, a piedi, lasciando il cavallo legato. La mattina dopo, sulla strada, c'è un mucchio di torba e un'etichetta disegnata a mano: una stella che cade su un prato.
    block setupEvent next=$hub:
      ! Paga $1 e guadagni 1 {icon:Chemical_Icon} e 1 Conoscenza Chimica (Chemistry Knowledge).
  fragment chiedi:
    > Il venditore ci pensa, con la fronte aggrottata. Viene da qui, dice. Da sempre. Prima era di un altro paese, con un altro nome, un'altra moglie, un cilindro. Poi è entrato nell'acqua e si è svegliato di qui. "Siamo tutti di qui", dice. "Anche voi, ormai. Ve ne accorgerete."
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Insanity_Icon}.

:: G3Nozze
  set evNozze = true
  # **Il matrimonio del reduce**
  > In chiesa si celebra il matrimonio di Jan Hoek, uno dei tre ragazzi del monumento, con Marieke, la ragazza che lo ha aspettato per quattro anni. Jan è tornato a giugno, sano, sorridente, senza documenti. Marieke ti ferma sul sagrato, prima della cerimonia, con il velo in mano. Ha ricevuto il telegramma del ministero, nel 1917: *disperso*. Poi Jan è tornato. È gentile, è paziente, non ha incubi. Non ricorda la canzone che le cantava sotto la finestra. Le chiede di sposarlo ogni giorno, con le stesse parole.

  > "Voi della tenuta sapete le cose", dice. "Devo sposarlo?"
  ! Che cosa fai?
  [[Le dici di sposarlo: è tornato, ed è buono. ~> sposa]]
  [[Le dici di aspettare. ~> aspetta]]
  [[Le chiedi di fargli cantare la canzone, all'altare. ~> canzone]]
  fragment sposa:
    set nozze = "sposati"
    set fiducia = $fiducia + 1
    set vicini = $vicini + 1
    > Marieke abbassa il velo ed entra in chiesa. Il matrimonio è perfetto: nessuno piange, nessuno ride, nessuno sbaglia una risposta. All'uscita, sotto la pioggia di riso, Jan stringe la mano della sposa con la sua mano fredda, e lei sorride. Un mese dopo la incroci al mercato: serena, calma, con le mani in tasca.
    block setupEvent next=$hub:
      ! Guadagni $2.
  fragment aspetta:
    set nozze = "rimandate"
    set fiducia = $fiducia - 1
    > Marieke ti guarda a lungo, poi si toglie il velo e torna a casa. Il matrimonio è rimandato "per motivi di salute della sposa". Jan non si offende. Le porta i fiori ogni mattina, puntuale, e aspetta. Ha tutto il tempo che vuole.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1VP.
  fragment canzone:
    set nozze = "canzone"
    > All'altare, davanti a tutti, Marieke chiede a Jan di cantarle la canzone della finestra. Jan sorride, gentile, e canta. Una canzone qualunque, intonata perfettamente, che nessuno ha mai sentito. Marieke lo ascolta fino alla fine. Poi dice di no, davanti al pastore, e scappa via dalla chiesa con il velo in mano. Jan resta all'altare, sereno, e ringrazia tutti per essere venuti.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.

:: G3Pastore
  set evPastore3 = true
  # **Il nuovo pastore**
  > In chiesa, alla funzione del giovedì, predica il pastore nuovo, arrivato dopo la morte del vecchio Kalf: un uomo giovane, biondo, con una voce calda e calma. Le sue prediche sono brevi, belle, senza minacce. Parlano di pace, di quiete, del sonno dei giusti. La chiesa è piena. Trijntje Kalf, all'organo, stona la sua nota di sempre, e lo guarda con odio. Dopo la funzione il pastore ti avvicina sul sagrato. Ha saputo della luce sulla torre. Vorrebbe benedire la Macchina.
  ! Che cosa fai?
  [[Gli permetti di benedirla. ~> benedici]]
  [[Gli chiedi da dove viene. ~> dove]]
  fragment benedici:
    set fiducia = $fiducia + 1
    > Il pastore sale alla torre con l'acqua santa e un libro. Davanti all'anello d'ottone recita una preghiera che non conosci, lunga, dolce, ripetitiva. Poi asperge l'anello. L'acqua santa, quando tocca il vetro nero, sfrigola, come su una stufa. Il pastore sorride, soddisfatto, e se ne va senza voltarsi.
    block setupEvent next=$hub:
      ! Guadagni 1VP e $1.
  fragment dove:
    > Il pastore ride: dal seminario della città, naturalmente. Ma quando gli chiedi il nome del seminario esita, un istante soltanto, e poi lo dice. Trijntje, che ha ascoltato da dietro la porta, ti prende da parte: ha scritto a quel seminario. Le hanno risposto che il pastore è annegato, due anni fa, pattinando su una torbiera vicino a Brunveen.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken} e 1 {icon:Creepy_Icon}.
