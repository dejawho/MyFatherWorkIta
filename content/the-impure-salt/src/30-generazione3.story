// Terza Generazione – "Il sale puro" (1911–1913).
// Luoghi delle pagine della Chronicle: ATOW 19 (Church con il simbolo dello Storybook, i due
// giornali, Farmer's Market); FotU 20 o 8 (Memorial Institute o Jail, Bank, Cemetery); FotU 21 o
// ATOW 16 (Town Hall, General Store, Farmer's Market).

:: SaleG3Intro [INTRO voice]
  # **GENERAZIONE III: Il sale puro**
  ! **Nota del notaio Ezra Pell al fascicolo – *1911.***
  > La città ha la luce elettrica, il tram e due giornali che si odiano: uno liberale, che dà la colpa di tutto ai ricchi, e uno conservatore, che dà la colpa di tutto ai poveri. Su una cosa vanno d'accordo: Mr. Umber vende copie. Sulla collina, accanto al manicomio, è sorto un Istituto di scienze tutto vetro e ottone, e i suoi professori scrivono ai giornali che il sale della tenuta è una superstizione da campagna.

  > Si sbagliano, ma non del tutto. Negli anni scorsi alcuni giovani della città hanno comprato da Lomax il sale nuovo, per scommessa o per disperazione, e l'hanno bevuto. Il sale nuovo funziona: l'altro esce, come sempre. Ma al mattino non torna più indietro. Due di loro sono al manicomio, e ridono giorno e notte; il terzo non l'ha più visto nessuno. Io l'ho conosciuto. Era il figlio del mio vicino, e mi salutava sempre togliendosi il cappello.

  > Io, quanto a me, ho cinquantasei anni e una tosse che i medici non sanno curare. Dormo poco, scrivo male, porto i guanti anche d'estate per via di un eczema alle mani. Lo studio va avanti per inerzia, con il vecchio commesso che mi tratta come un figlio malato. Ho deciso di tenere questo fascicolo in ordine fino alla fine. Chi lo leggerà dopo di me saprà giudicare se ne valeva la pena.
  [[Clicca per continuare... => G3LetteraA]]

// Una lettera segreta del notaio a ciascun erede, tutte della stessa forma.
::for L in A B C D | Fine
:: G3Lettera%L%
  if %L.n% > $players:
    goto G3LetteraFine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **Una lettera del notaio**
  > Una busta dello studio notarile Pell, con il tuo nome scritto a mano, in una grafia così tremante che il postino ha dovuto chiedere due volte l'indirizzo. Dentro, poche righe. Il notaio ti prega, "per il bene della famiglia e in nome dell'amicizia che ha sempre legato le nostre famiglie", di portargli in segreto una cosa dalla tenuta, senza dirlo a nessuno.
  if %L.n% == 1:
    > *Una pagina del diario del vecchio, una qualunque, purché scritta nella sua grafia di notte.*
  elif %L.n% == 2:
    > *Un pizzico del sale nuovo che usate in laboratorio, in una carta ben chiusa.*
  elif %L.n% == 3:
    > *Una copia della chiave del vostro cancello, che vi restituirò entro la settimana.*
  else:
    > *Un capello del vecchio, dalla spazzola d'argento che dovrebbe essere ancora sul suo comò.*
  ! Che cosa fai?
  [[Porti al notaio quello che chiede. ~> porta]]
  [[Non fai niente. ~> niente]]
  [[Mostri la lettera agli altri. ~> mostra]]
  fragment porta:
    set aiutiEzra = $aiutiEzra + 1
    > Lo porti allo studio il giorno dopo, in una busta senza nome. Il commesso la prende senza guardarti in faccia. Due giorni dopo arriva un biglietto di ringraziamento, e del denaro, "per il disturbo".
    block setupEvent next=G3Lettera%L.next%:
      ! Guadagni $3. Non dire agli altri che cosa hai fatto.
  fragment niente:
    > Metti la lettera in un cassetto e non rispondi. Il notaio non insiste. Ma la grafia tremante, chissà perché, ti torna in mente ogni volta che apri il cassetto.
    block setupEvent next=G3Lettera%L.next%:
      ! Non succede niente.
  fragment mostra:
    set lettera = true
    > Mostri la lettera agli altri, a cena, e la leggi ad alta voce. Qualcuno ride: il vecchio notaio sta perdendo la testa. Qualcun altro non ride affatto, e vuole sapere se anche gli altri ne hanno ricevuta una.
    block setupEvent next=G3Lettera%L.next%:
      ! Leggi ad alta voce la lettera agli altri giocatori. Guadagni 1VP.
::endfor

:: G3LetteraFine
  # **Il mattino dopo**
  > A colazione nessuno parla di lettere. Il tram passa davanti al cancello alle otto in punto, come ogni mattina, e il cronista del giornale liberale è già appostato dall'altra parte della strada, con il taccuino in mano.
  [[Continua... => G3Rivelazione]]

// Nella Terza Generazione l'Erede nell'Ombra non si nasconde più: Umber è di famiglia.
:: G3Rivelazione
  # **Umber è di famiglia**
  if $ombra == "":
    > L'Ispettore Ada Haskett, prima di andare in pensione, ha fatto rifare la perizia su tutti gli assegni degli ultimi vent'anni. Il risultato è sul tavolo della biblioteca, in una busta della polizia: nessuno è stato scritto da qualcuno della famiglia. Nessuno di voi era Umber, né lo è mai stato.

    > Eppure gli assegni continuano ad arrivare, con i vostri nomi. La grafia inclinata è sempre la stessa, quella del vecchio: solo più stanca, più lenta, come la mano di un uomo che invecchia. Chi li firma, allora?
    [[Continua... ~> 0]]
  elif $umber == "preso":
    > L'Erede nell'Ombra è morto in prigione molti anni fa, senza ricordare niente, e la città ha festeggiato. Ma il sangue non si arresta. In famiglia nessuno lo dice ad alta voce, però tutti lo hanno notato: quando i più giovani scrivono in fretta, la loro mano comincia a pendere all'indietro.
    [[Continua... ~> 0]]
  else:
    > Una sera, a cena, chi porta il sangue dell'Erede nell'Ombra posa le posate e racconta tutto: le notti, le scarpe infangate, gli assegni, il bastone spezzato nel vicolo. Nessuno interrompe. Alla fine qualcuno versa da bere a tutti, e la cena continua. Non c'è più niente da nascondere: Umber è di famiglia, come l'argenteria e i debiti.
::for L in A B C D
    if $ombra == "%L%":
      ! **{$name%L%}** era l'Erede nell'Ombra: guadagna 3VP. Nella votazione finale il suo voto vale doppio.
::endfor
    [[Continua... ~> 0]]
  fragment 0:
    block setupEvent next=G3Cappotto:
      include AzzeraTraguardi
      include PosaTraguardi
      set _SetupImage = "S2_CollaborativeToken"
      ! Dalla Scatola di **Fear of the Unknown** prendete i **3 Collaborative Experiment** e i **Collaboration token** {icon:S2_CollaborativeToken}: sono **l'antidoto**. Mettete gli Esperimenti scoperti accanto al tabellone, disponibili per tutti.
      if $lomax == "registro":
        set antidoto = 1
        ! La famiglia conserva ancora la pagina del registro di Lomax comprata al mercato tanti anni fa: è un passo avanti. Rimettete nella scatola uno dei Collaborative Experiment, a vostra scelta: per l'antidoto ne bastano due.

:: G3Cappotto
  # **Il cappotto nero**
  > In soffitta, in un baule chiuso con lo spago, c'è un cappotto nero. È troppo largo per un uomo piccolo e troppo corto per un uomo alto; ha le tasche consumate, un bottone di corno sostituito con uno d'osso e, nella fodera, una macchia scura che nessuno ha voglia di annusare. Nessuno sa chi l'abbia messo lì. Tutti sanno di chi è.
  ! Che cosa fate del cappotto? *(Decidete insieme.)*
  [[Lo bruciate in giardino. ~> brucia]]
  [[Lo appendete all'ingresso, dove si vede. ~> appendi]]
  [[Lo date alla compagnia di teatro. ~> teatro]]
  fragment brucia:
    set cappotto = "bruciato"
    set sospetto = $sospetto - 1
    > Il cappotto brucia male, con un fumo nero e grasso che sa di tabacco e di acido. I vicini, dalle finestre, vedono il falò e se lo raccontano per giorni: la famiglia della tenuta brucia le prove.
    block setupEvent next=G3R1:
      ! Non succede niente.
  fragment appendi:
    set cappotto = "appeso"
    > Lo appendete all'attaccapanni dell'ingresso, accanto ai vostri. I visitatori lo notano subito, e nessuno osa chiedere. Qualche mattina vi sembra che sia stato spostato di un gancio. Qualche mattina ha le maniche bagnate.
    block setupEvent next=G3R1:
      ! Ogni giocatore guadagna 1 {icon:Creepy_Icon}.
  fragment teatro:
    set cappotto = "teatro"
    > La compagnia che recita *Il dottore e il suo doppio* lo accetta con entusiasmo: è il costume perfetto. Da quella sera l'attore che fa Umber lo porta in scena, e giura che ci si sente bene dentro. Troppo bene.
    block setupEvent next=G3R1:
      ! Ogni giocatore guadagna 1VP.

:: G3R1 [HUB]
  # **IL SALE IMPURO – Giovinezza**
  set round = 7
  if $hub != "G3R1":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Aprite la Village Chronicle alla sezione **A Time of War** ({icon:S3_ScenarioIcon}) e andate a **pagina 19**.
      include PreparaFolla
  set hub = "G3R1"
  include Traguardi
  include VociG3
  if !$evMadre:
    block hubTitle:
      ! {icon:Storybook} **La donna in nero – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G3Madre]]
  if !$evArchivio:
    block hubTitle:
      ! {icon:Storybook} **L'archivio Pell – Library**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Library [[clicca qui. -> G3Archivio]]
  if !$evBoccette3 && $boccette == "tenute":
    block hubTitle:
      ! {icon:Storybook} **Le boccette vuote – nella Tenuta**
    block hubDetails:
      ! Le sei boccette vuote del bisnonno sono ancora nel laboratorio. Quando il tuo Scienziato fa un'azione nella Tenuta, [[clicca qui. -> G3Boccette]]
  if !$evFabbro:
    block hubTitle:
      ! {icon:Storybook} **Il vecchio fabbro – Blacksmith**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Blacksmith [[clicca qui. -> G3Fabbro]]
  if !$evGiornali:
    block hubTitle:
      ! {icon:Storybook} **Due giornali – The Morning Liberal, Conservative Report**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo a The Morning Liberal o al Conservative Report [[clicca qui. -> G3Giornali]]
  block hubTitle:
    ! {icon:Storybook} **Il venditore di specchi – Farmer's Market**
  block hubDetails:
    ! Quando un tuo pezzo visita il Farmer's Market, puoi pagare $1 e guardarti in uno specchio: [[clicca qui. -> G3Specchi]]
  block hubTitle:
    ! **Evento del primo Round**
  block hubDetails:
    > I due giornali della città si contendono Umber. Per quello liberale è un ricco che si diverte a spese dei poveri; per quello conservatore, un povero che si veste da ricco. Tutti e due mandano un cronista alla tenuta, ogni mattina.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G3R1" next="G3Lomax"

::round G3R1 7
fine: La Giovinezza della Terza Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Maturità prima di continuare.

// Il sale nuovo e l'antidoto: le voci dell'hub della Terza.
:: VociG3
  block hubTitle:
    ! {icon:Chemical_Icon} **Il sale nuovo**
  block hubDetails:
    ! Quando il tuo Scienziato fa un'azione nella Tenuta, puoi bere il sale nuovo del farmacista: [[clicca qui. -> BeviChi]]
  if $antidoto < 3:
    block hubTitle:
      ! {icon:S2_CollaborativeToken} **L'antidoto**
    block hubDetails:
      ! Quando i giocatori completano uno dei Collaborative Experiment, [[clicca qui. -> G3Antidoto]]

:: G3Antidoto
  set antidoto = $antidoto + 1
  # **L'antidoto**
  if $antidoto >= 3:
    > Il terzo esperimento riesce all'alba, dopo una notte intera di vetri rotti e di fiammiferi. Nel bicchiere, finalmente, il colore cambia come una volta: rosso, poi viola scuro, poi il verde di uno stagno. Poi, piano, diventa trasparente come l'acqua. Non è il sale del vecchio: è il suo contrario. Chi lo beve torna uno solo, per sempre.

    > Resta da sapere se funziona davvero. Qualcuno deve assaggiarlo per primo.
    ! Chi lo assaggia? *(Decidete insieme.)*
    [[Lo assaggi tu, che hai completato l'esperimento. ~> tu]]
    [[Lo provate su un topo del laboratorio. ~> topo]]
    if $madre:
      [[Lo portate al figlio della donna in nero. ~> ragazzo]]
  else:
    > Un passo avanti. Nel bicchiere il colore arriva al viola e lì si ferma, ostinato, come se aspettasse qualcosa. Manca ancora un ingrediente, e nessuno dei vostri libri sa dire quale: l'impurità che c'era nella prima partita, e che nessuno ha mai scritto.
    if $polvere:
      > Qualcuno, in famiglia, ricorda le parole del vecchio Lomax al General Store: *grigia, era grigia*. Il problema non è sapere che colore aveva. È sapere dove trovarla.
    [[Torna al Round => $hub]]
  fragment tu:
    set prova = "tu"
    > Lo bevi in un sorso. Sa di niente, come l'acqua. Per un'ora non succede niente; poi ti siedi, ti viene sonno, e ti svegli la mattina dopo con una strana sensazione di silenzio nella testa, come quando smette di piovere. Ti guardi allo specchio. C'è una faccia sola.
    block setupEvent next=$hub:
      ! Arretra di 2 caselle sul tracciato {icon:Insanity_Icon} e guadagni 1VP.
  fragment topo:
    set prova = "topo"
    > Il topo beve, si lava i baffi e si addormenta. La mattina dopo è vivo, sveglio, e perfettamente normale. È anche, per la prima volta da quando è in gabbia, del tutto disinteressato a scappare. Non sapete se sia una buona notizia.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Biologica (Biology Knowledge).
  fragment ragazzo:
    set prova = "ragazzo"
    > Al manicomio, il figlio della donna in nero beve il bicchiere senza fare domande, ridendo. Smette di ridere a metà del pomeriggio. La sera chiede di sua madre, con la sua voce, e lei arriva di corsa, in vestaglia, sotto la pioggia.
    block setupEvent next=$hub:
      ! Ogni giocatore guadagna 1VP.

// Gli eventi dei Luoghi della Terza Generazione.
:: G3Madre
  set evMadre = true
  # **La donna in nero**
  > Nella chiesa nuova, tutta stucchi e oro, una donna in nero accende una candela dopo l'altra davanti all'altare, finché il sagrestano non le dice che bastano. Suo figlio è uno dei ragazzi del sale nuovo: due anni fa l'ha bevuto per scommessa, e da allora vive nel reparto dei signori, e ride.

  > Ti riconosce: tutta la città conosce la famiglia della tenuta. Non ti accusa. Ti chiede soltanto, con la voce di chi l'ha già chiesto a tutti, se c'è un modo per farlo tornare.
  ! Che cosa le dici?
  [[Le prometti che troverete un antidoto. ~> promessa]]
  [[Le dai $2 per le cure del figlio. ~> soldi]]
  [[Le dici la verità: un modo non c'è. ~> verita]]
  fragment promessa:
    set madre = true
    > La donna ti prende la mano tra le sue e la stringe forte, senza dire niente. Esce dalla chiesa più dritta di come ci era entrata. Tu resti lì, davanti alle candele, a chiederti quante promesse ha fatto questa famiglia, in cinquant'anni, e quante ne ha mantenute.
    block setupEvent next=$hub:
      ! Guadagni 1VP. Se l'antidoto sarà pronto, lei se ne ricorderà.
  fragment soldi:
    set sospetto = $sospetto - 1
    > La donna prende il denaro e ti ringrazia, a voce alta, perché la sentano tutti. Presto, in città, si dice che la famiglia della tenuta paga le cure dei ragazzi del sale. Qualcuno ci vede un'ammissione di colpa. I più, per una volta, una gentilezza.
    block setupEvent next=$hub:
      ! Paga $2.
  fragment verita:
    > Glielo dici piano, con le parole più semplici che trovi. Lei annuisce, come se lo sapesse già. Poi ti racconta di suo figlio: che non dorme, che non mangia, che scrive lettere con la sinistra e le firma con un nome che non è il suo. Ti racconta tutto, per un'ora intera, e tu ascolti.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Biologica (Biology Knowledge) e 1 {icon:Insanity_Icon}.

:: G3Giornali
  set evGiornali = true
  # **Due giornali**
  > Le redazioni dei due giornali sono una di fronte all'altra, sulla stessa piazza, e i loro direttori non si salutano da vent'anni. Tutti e due, saputo che sei in piazza, ti mandano incontro un ragazzo con un biglietto da visita. Tutti e due ti offrono la stessa cosa: la prima pagina, un'intervista esclusiva sulla famiglia e su Umber, e la versione dei fatti che preferisci.
  ! Che cosa fai?
  [[Parli con il giornale liberale. ~> liberale]]
  [[Parli con il giornale conservatore. ~> conservatore]]
  [[Vendi la storia vera a tutti e due. ~> venduta]]
  fragment liberale:
    set stampa = "liberale"
    set sospetto = $sospetto - 1
    > Il giornale liberale scrive che Umber è un ricco annoiato, forse un professore dell'Istituto, che si diverte a spaventare i poveri. Il giornale conservatore risponde che il giornale liberale è pagato dalla tenuta. Per una settimana la città litiga sui giornali, e nessuno guarda dalla vostra parte.
    block setupEvent next=$hub:
      ! Guadagni $2.
  fragment conservatore:
    set stampa = "conservatore"
    set sospetto = $sospetto - 2
    > Il giornale conservatore scrive che Umber è un povero travestito da signore, uno dei tanti che dormono nei dormitori vicino alla stazione. La polizia, la notte dopo, rastrella i dormitori. Nessuno di quelli che arresta è Umber. La tenuta, per un po', ha pace.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon}: non è una bella pace.
  fragment venduta:
    set stampa = "venduta"
    set sospetto = $sospetto + 2
    > Racconti la storia vera due volte, a due cronisti diversi, e ti fai pagare due volte. Il giorno dopo i due giornali escono con lo stesso titolo, per la prima volta nella loro storia: *IL SALE DELLA TENUTA*. La città non parla d'altro. Sulla porta della tenuta, la mattina, qualcuno ha disegnato con il gesso un piccolo uomo con il cappotto nero.
    block setupEvent next=$hub:
      ! Guadagni $4 e 1 {icon:Creepy_Icon}.

// Il venditore di specchi: si può tornare quante volte si vuole, con un esito a caso.
:: G3Specchi
  # **Il venditore di specchi**
  ! Paga $1.
  > Al mercato c'è un banco nuovo, coperto di specchi di ogni misura: da tasca, da toeletta, da parete, con le cornici dorate e quelle di legno grezzo. Il venditore ha la barba bianca e un occhio di vetro. "Specchi veri", dice. "Mostrano quello che c'è." Ne scegli uno, a caso, e ci guardi dentro.
  set variante = either(1, 2, 3, 4)
  if $variante == 1:
    > Ti vedi vecchio, molto più vecchio di adesso, con gli occhi del ritratto che sta nella biblioteca della tenuta. Il venditore annuisce, soddisfatto. "Somigliate a qualcuno", dice. "Tutti somigliano a qualcuno."
    ! Guadagni 1 {icon:Chemical_Icon} e 1 {icon:Insanity_Icon}.
  elif $variante == 2:
    > Nello specchio non c'è niente: il mercato alle tue spalle, la gente, il banco, ma tu no. Il venditore ti restituisce la moneta senza dire una parola, e ti volta le spalle.
    ! Riprendi il tuo $1 e guadagni 1 {icon:Creepy_Icon}.
  elif $variante == 3:
    > Dietro di te, nello specchio, c'è un piccolo uomo con il cappotto nero, che ti saluta con la mano. Ti volti: nessuno. Quando torni allo specchio, l'uomo è più lontano, e ti saluta ancora, come si saluta chi parte.
    ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon}.
  else:
    set specchio = true
    > Dietro di te, nello specchio, c'è il notaio Ezra Pell, con il cappello in mano, e sorride. Ti volti per salutarlo: nessuno. Il venditore guarda lo specchio, poi te, poi di nuovo lo specchio, e copre il banco con un telo. "Per oggi basta", dice.
    ! Guadagni 1 {icon:Insanity_Icon} e 1VP.
  [[Torna al Round. => $hub]]

:: G3Archivio
  set evArchivio = true
  # **L'archivio Pell**
  > Il notaio Ezra Pell ha donato alla Library l'archivio di suo padre: quarant'anni di atti, testamenti e corrispondenza, in cento scatole di cartone, catalogate con cura. La bibliotecaria ne è orgogliosissima. Manca soltanto una scatola, la numero 61, quella dell'anno 1861. Il notaio, dice, l'ha tenuta per sé, "per ragioni di famiglia".
  ! Che cosa fai?
  [[Leggi la corrispondenza di Silas Pell con il vecchio. ~> lettere]]
  [[Chiedi alla bibliotecaria di scrivere al notaio per la scatola 61. ~> scatola]]
  fragment lettere:
    > Le lettere del vecchio a Silas sono brevi, affettuose, piene di formule e di battute. Le ultime, del 1860, sono diverse: più corte, più nervose, in una grafia che comincia a inclinarsi. L'ultima dice soltanto: *Perdonami per la credenza. Non potevo chiedertelo: avresti detto di no.* Silas non ha mai risposto. O la risposta è nella scatola 61.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge) e 1 {icon:Insanity_Icon}.
  fragment scatola:
    > La bibliotecaria scrive. Il notaio risponde a giro di posta, con una grafia così tremante che la bibliotecaria deve leggerla con la lente: la scatola 61 è andata distrutta in un piccolo incendio, nel suo studio, molti anni fa. La bibliotecaria si dice dispiaciuta. Tu ti chiedi perché un incendio dovrebbe scegliere una scatola sola.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G3Boccette
  set evBoccette3 = true
  # **Le boccette vuote**
  > Le sei boccette del bisnonno sono ancora nella cassetta di zinco, sotto la tavola smossa accanto alla stufa: la ceralacca rotta, le etichette scolorite, *Farmacia Lomax – prima partita*. Sul fondo di vetro resta la stessa patina grigiastra di sempre. Nessuno, in famiglia, ha mai avuto il coraggio di grattarla via.
  ! Che cosa fai?
  [[Gratti la patina dal fondo delle boccette. ~> gratta]]
  [[Le vendi all'Istituto, per $3. ~> vendi]]
  fragment gratta:
    > Con un ago e molta pazienza raccogli, da tutte e sei, un pizzico di polvere grigia, così poca che sta sulla punta di un coltello. Nel bicchiere, con il sale nuovo, il colore arriva al viola, esita, e per un istante diventa verde.
    if $antidoto < 3:
      block setupEvent next=G3Antidoto:
        ! L'antidoto fa un passo avanti: rimettete nella scatola uno dei Collaborative Experiment non ancora completati.
    else:
      block setupEvent next=$hub:
        ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge) e 1VP.
  fragment vendi:
    set istituto = true
    > Il rettore dell'Istituto le compra senza discutere, e le espone in una vetrina del corridoio principale, con un cartellino scritto a mano: *Le boccette originali.* Gli studenti ci passano davanti ogni giorno. Qualcuno, di notte, ci lascia una violetta.
    block setupEvent next=$hub:
      ! Guadagni $3.

:: G3Patto
  set evPatto3 = true
  # **L'assegno in bianco**
  > Al catasto, nel municipio, l'impiegato ti mostra con imbarazzo un atto di acquisto appena depositato. Qualcuno ha comprato la striscia di terra lungo il vicolo dietro la tenuta, pagando con un assegno. L'assegno è autentico: è firmato da uno dei vostri nonni, nel 1877, nella sua grafia diritta. La cifra e il nome del beneficiario, invece, sono stati scritti la settimana scorsa, nella grafia che pende all'indietro.
  ! Che cosa fai?
  [[Onori l'assegno: la firma è di famiglia. ~> onora]]
  [[Lo denunci come falso. ~> denuncia]]
  fragment onora:
    > Paghi, e il vicolo, da oggi, è di proprietà di un certo signor Umber, con regolare atto notarile. Lo ha redatto, noti, lo studio Pell. Il notaio non si è fatto pagare la parcella.
    block setupEvent next=$hub:
      ! Paga $3 e guadagni 2VP.
  fragment denuncia:
    set sospetto = $sospetto + 2
    > Il giudice ti dà ragione, dopo un mese di udienze. La firma è autentica, ma l'assegno non è valido: il firmatario è morto da trent'anni. La città, però, ha ascoltato tutto il processo, e adesso sa che un erede della tenuta, nel 1877, firmò un assegno in bianco a Mr. Umber.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Creepy_Icon}.

:: G3Fabbro
  set evFabbro = true
  # **Il vecchio fabbro**
  > Il fabbro è un vecchio con le braccia ancora forti e la lingua ancora lunga: quarant'anni fa era l'apprendista, quello della chiave senza denti. Se lo ricorda benissimo, il piccolo signore con il cappotto nero. "Pagava con assegni", dice. "Sempre buoni."
  if $chiave != "":
    > Poi ti guarda meglio. "Voi siete della tenuta. Una copia di quella chiave la feci per la vostra famiglia, tanti anni fa. E un'altra, l'anno scorso."
  else:
    > Poi abbassa la voce. "Lo stampo l'ho tenuto, sapete. E l'anno scorso è servito."
  ! Che cosa fai?
  [[Paghi $2 perché ti dica per chi era l'ultima chiave. ~> paga]]
  [[Gli compri lo stampo, per $3. ~> stampo]]
  fragment paga:
    set fabbro = true
    > Il fabbro intasca le monete e si gratta la barba. "Un signore anziano, distinto, con i guanti", dice. "Non si è mai tolto i guanti. Ha pagato in contanti, questa volta, e ha voluto la ricevuta. Sulla ricevuta c'era il timbro di uno studio."
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon}.
  fragment stampo:
    > Il fabbro te lo vende con un po' di rimpianto, avvolto in un panno unto. È un blocchetto di gesso con l'impronta di una chiave senza denti, con la testa a forma di occhio. A casa lo metti sulla mensola del camino. La mattina dopo è incrinato, come se qualcuno l'avesse stretto troppo forte.
    block setupEvent next=$hub:
      ! Paga $3 e guadagni 2VP.

:: G3Statua
  set evStatua = true
  # **La statua**
  > Per i cinquant'anni dalla posa della prima pietra del manicomio, il consiglio comunale ha deciso di onorare "i benefattori della scienza cittadina", e nella Foundry si sta fondendo una statua di bronzo del vecchio della tenuta: alto, distinto, con il diario sotto il braccio, come nel ritratto. Il caposquadra ti fa vedere lo stampo con orgoglio. Il comitato, dice, ha pagato con un contributo anonimo molto generoso.
  ! Che cosa fai?
  [[Contribuisci con $2 al piedistallo. ~> contribuisci]]
  [[Chiedi di cambiare la faccia della statua. ~> faccia]]
  [[Sabotate lo stampo, di notte. ~> sabota]]
  fragment contribuisci:
    set sospetto = $sospetto - 1
    > Il nome della famiglia viene inciso sul piedistallo, sotto quello del vecchio, in lettere più piccole. All'inaugurazione il sindaco fa un discorso sul progresso, e la banda suona. La statua guarda la piazza con aria severa. Di notte, qualcuno le mette in testa un cappello nero.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 2VP.
  fragment faccia:
    > Il caposquadra ti guarda come un pazzo, ma per una mancia rifà la testa. La nuova faccia è quella di un uomo qualunque, senza età, senza espressione. Il comitato non se ne accorge. La città nemmeno. Soltanto il notaio Pell, all'inaugurazione, si ferma davanti alla statua e dice, a voce bassa: "Così è più somigliante."
    block setupEvent next=$hub:
      ! Paga $1. Guadagni 1VP e 1 {icon:Insanity_Icon}.
  fragment sabota:
    set sospetto = $sospetto + 2
    > Di notte entri nella fonderia e versi un secchio d'acqua nello stampo ancora caldo. Il bronzo si crepa con un rumore di campana rotta. All'alba la statua ha una spaccatura che le attraversa la faccia, dalla fronte al mento, e la città parla soltanto di quello. La polizia apre un fascicolo.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon} e 1 {icon:Gears_Icon}.

:: G3FuneraleLomax
  set evFuneraleLomax = true
  # **Il funerale del farmacista**
  > Il funerale di Lomax è povero e breve: il parroco, due nipoti annoiati, una vecchia che vendeva sapone accanto al suo banco, e nessun cliente. Il notaio Ezra Pell è in prima fila, con i guanti neri. Durante la benedizione si sfila un guanto e posa sulla bara un mazzetto di violette.
  ! Che cosa fai?
  [[Paghi $2 per una lapide degna. ~> lapide]]
  [[Ti avvicini al notaio. ~> notaio]]
  [[Resti in fondo, a guardare. ~> guarda]]
  fragment lapide:
    > Lo scalpellino incide il nome di Lomax, le date e una riga che scegli tu: *Vendeva sale. Era puro.* I nipoti trovano la frase incomprensibile. Il notaio, quando la legge, si toglie il cappello.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 2VP.
  fragment notaio:
    set ezra = $ezra + 1
    > Ezra ti saluta con un cenno e ti tiene accanto per tutta la funzione, come si tiene accanto un parente. Alla fine ti stringe il braccio. "Era un brav'uomo", dice. "Ha portato un segreto per più di cinquant'anni. Io so quanto pesa."
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment guarda:
    > Resti in fondo, vicino alla porta. Da lì vedi quello che dalla prima fila non si vede: quando il notaio si sfila il guanto, la sua mano destra ha le dita macchiate di viola, e trema. Quando se lo rimette, smette di tremare.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon}.

:: G3Recita
  set evRecita = true
  # **L'ultima recita**
  > La compagnia che da più di vent'anni recita *Il dottore e il suo doppio* dà l'ultima rappresentazione, poi si scioglie: il capocomico è vecchio, gli attori sono stanchi, e la città ha il cinematografo. Il tendone è pieno. In prima fila ci sono il sindaco, il rettore dell'Istituto e il notaio Ezra Pell, con i guanti.
  if $cappotto == "teatro":
    > L'attore che fa Umber porta il cappotto nero che gli avete regalato. Stasera, dicono, è più bravo che mai.
  ! Che cosa fai?
  [[Resti fino alla fine. ~> resta]]
  [[Vai dietro le quinte, durante il secondo atto ($2). ~> quinte]]
  fragment resta:
    > Nel terzo atto il dottore insegue il doppio sui tetti, lo raggiunge e gli strappa il cappello. Stasera, sotto il cappello, non c'è la faccia di suo figlio: c'è una faccia vecchia, magra, stanca. L'attore non è mai stato truccato così, giura poi il capocomico. Il notaio Pell, in prima fila, esce prima degli applausi.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Insanity_Icon}.
  fragment quinte:
    > Dietro le quinte, tra i costumi appesi, trovi l'attore che fa Umber seduto su un baule, con la testa tra le mani. "Non so più quando smetto di recitare", ti dice. "Vent'anni dentro questo personaggio. Certe sere esco dal tendone e vado in giro, e la gente scappa, e mi piace." Ti chiede dei soldi per il treno. Vuole andarsene stanotte.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 2VP.

:: G3Tomba
  set evTomba3 = true
  # **La tomba del vecchio**
  if $lapide == "senza nome":
    > La lapide senza nome del vecchio, quella che la famiglia ha fatto raschiare tanti anni fa, è stata ripulita. Qualcuno ha inciso di nuovo il nome, con lettere piccole e accurate, e sotto, ancora più piccolo: *Non ancora.*
  elif $lapide == "torna presto":
    > Sotto il nome del vecchio e le parole *Torna presto*, che la famiglia ha fatto incidere tanti anni fa, qualcuno ha aggiunto con un chiodo, in una grafia che pende all'indietro: *Quasi.*
  else:
    > Sulla tomba del vecchio, la lapide è al suo posto, con il nome e le due date. La terra davanti, però, è smossa di fresco, come se qualcuno avesse scavato e richiuso, di notte, con cura.
  > Sulla pietra c'è un mazzetto di violette fresche, legate con lo spago.
  ! Che cosa fai?
  [[Fai riaprire la tomba ($1). ~> apri]]
  [[Porti via le violette ($1). ~> violette]]
  fragment apri:
    set sospetto = $sospetto + 1
    > Il custode borbotta, ma per un'ora di lavoro e qualche moneta la riapre. La bara è sempre lì, vuota. Sul fondo, però, c'è una cosa che cinquant'anni fa non c'era: un astuccio di cuoio da notaio, vuoto anche lui, con le iniziali raschiate.
    block setupEvent next=$hub:
      ! Paga $1. Guadagni 1 {icon:Creepy_Icon} e 1 {icon:Insanity_Icon}.
  fragment violette:
    > Le porti via, e il giorno dopo ci sono di nuovo. Il custode, interrogato, giura di non aver mai visto chi le porta. Poi, dopo una mancia, ammette di aver visto qualche volta, all'alba, un signore anziano con i guanti. "Uno per bene", dice. "Non vi preoccupate."
    block setupEvent next=$hub:
      ! Paga $1 e guadagni 1VP.

:: G3Istituto
  set evIstituto = true
  # **L'offerta dei professori**
  > Il Memorial Institute è tutto vetro e ottone, con i corridoi che sanno di acido fenico e i professori in camice bianco che camminano in fretta, come se qualcuno li inseguisse. Il rettore ti riceve in uno studio pieno di microscopi. Ha davanti a sé un ritaglio di giornale sul sale della tenuta, sottolineato in rosso.

  > Vuole la formula. Vuole gli appunti della famiglia, il diario, tutto. In cambio offre una cifra che ti fa girare la testa, e una cattedra con il nome del vecchio.
  ! Che cosa fai?
  [[Vendi gli appunti della famiglia. ~> vendi]]
  [[Proponi di lavorare insieme all'antidoto. ~> insieme]]
  [[Rifiuti. ~> rifiuta]]
  fragment vendi:
    set istituto = true
    set sospetto = $sospetto + 1
    > Il rettore firma l'assegno senza discutere. Una settimana dopo, nelle vetrine dell'Istituto, compare un manifesto: *Il sale della tenuta: la scienza al servizio del popolo*. Non dice quale popolo.
    block setupEvent next=$hub:
      ! Guadagni $5.
  fragment insieme:
    > Il rettore ci pensa a lungo, poi ti presenta due assistenti giovani, svegli, con le dita macchiate di giallo. Lavorano con te per tre notti. Non trovano l'impurità, ma ti insegnano un metodo per cercarla.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge) e 1VP.
  fragment rifiuta:
    > Rifiuti con gentilezza, e il rettore ti accompagna alla porta con la stessa gentilezza. In corridoio, da una porta socchiusa, vedi un professore che versa del sale bianco in un bicchiere d'acqua, e aspetta. Il colore diventa rosso, e si ferma lì.
    block setupEvent next=$hub:
      ! Guadagni 2VP.

:: G3Prigioniero
  set evIstituto = true
  # **Il prigioniero**
  > Il parente accusato per Umber, tanti anni fa, è ancora in cella, perché nessuno ha mai avuto il coraggio di riaprire il caso. È invecchiato tra quei muri: magro, curvo, con gli occhi chiari di chi guarda fuori da una finestra da vent'anni. La finestra dà sul vicolo.

  > "Lo vedo passare, sai", ti dice. "Quasi ogni notte. Umber. Non è più quello di una volta: è invecchiato anche lui."
  ! Che cosa fai?
  [[Lo ascolti fino in fondo. ~> ascolta]]
  [[Paghi $3 al secondino perché lo lasci uscire. ~> esce]]
  fragment ascolta:
    set testimone = true
    > "Cammina con un bastone nuovo, d'ebano", racconta. "E porta una borsa di cuoio, di quelle con la chiusura d'ottone, come i medici. O i notai. Si ferma sotto la mia finestra, a volte, e alza il cappello. Mi conosce. Credo che gli dispiaccia."
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e 1VP.
  fragment esce:
    set sospetto = $sospetto + 1
    > Il secondino conta il denaro, si gratta la testa e lascia la porta della cella aperta, una notte, dimenticandosi di chiuderla. Il parente torna alla tenuta all'alba, a piedi, con le scarpe sporche del fango del vicolo. Pianta rose in giardino per tutta la primavera, e non parla mai di quello che ha visto dalla finestra.
    block setupEvent next=$hub:
      ! Paga $3 e guadagni 2VP.

:: G3Banca
  set evBanca3 = true
  # **Il conto del vecchio**
  > Il conto del vostro bisnonno è ancora aperto: cinquant'anni, ormai. Il direttore della Bank è cambiato tre volte, ma il registro è lo stesso, e lo tiene sotto chiave come una reliquia. L'ultimo prelievo è di ieri. La firma pende all'indietro, e trema.
  if $conto:
    > I versamenti, dice il direttore, li porta ancora il commesso dello studio notarile Pell. Ormai è un uomo anziano, e non sorride più.
  ! Che cosa fai?
  [[Paghi $2 per vedere l'ultimo assegno. ~> assegno]]
  [[Chiedi al tribunale di congelare il conto. ~> congela]]
  fragment assegno:
    set inchiostro = true
    > Il direttore te lo mostra sotto la lampada. La grafia è quella di sempre, minuta, all'indietro. L'inchiostro no: è viola, di quel viola acido che non si trova nelle cartolerie e che usano soltanto gli studi notarili, per gli atti che non si possono falsificare.
    block setupEvent next=$hub:
      ! Paga $2. Guadagni 1VP e 1 {icon:Insanity_Icon}.
  fragment congela:
    set sospetto = $sospetto + 1
    > Il tribunale ci mette un mese, e alla fine dà ragione alla famiglia: il conto è congelato fino alla lettura definitiva del testamento. Il giorno dopo la sentenza, sul gradino della tenuta, c'è un assegno strappato in otto pezzi.
    block setupEvent next=$hub:
      ! Guadagni 2VP.

:: G3Nell
  set evNell = true
  # **Un funerale**
  > Seppelliscono l'Ispettore Nell Haskett in un giorno di sole, a ottantasei anni, con la banda della polizia e due discorsi troppo lunghi. Ada è in prima fila, con il vecchio cappotto da ispettore e il taccuino nero della zia stretto in mano. Al cimitero c'è anche il notaio Ezra Pell, in fondo, accanto al cancello. Se ne va prima della benedizione.
  ! Che cosa fai?
  [[Chiedi ad Ada di leggere il taccuino della zia. ~> taccuino]]
  [[Porti un fiore sulla tomba, e te ne vai. ~> fiore]]
  fragment taccuino:
    if $haskett > 0 || $ada > 0:
      set taccuino = true
      > Ada esita, poi te lo porge. "La zia diceva che di voi ci si poteva fidare", dice. "Almeno di uno." Le pagine sono cinquant'anni di appunti in stampatello. L'ultima annotazione su Umber è del 1895: *Gli assegni cambiano. Stessa mano, ma più pesante. Comincia l'inverno in cui il giovane Pell smette di dormire.*
      block setupEvent next=$hub:
        ! Guadagni 1VP e 1 {icon:Insanity_Icon}.
    else:
      > Ada stringe il taccuino al petto. "La zia lo ha lasciato a me", dice. "E voi non vi siete mai fidati di lei. Perché dovrei fidarmi io di voi?" Si volta, e torna dalla zia.
      block setupEvent next=$hub:
        ! Guadagni 1 {icon:Creepy_Icon}.
  fragment fiore:
    > Lasci un fiore sulla tomba e ti fermi un momento. Accanto, sulla lapide di Silas Pell, c'è un mazzetto di violette fresche, legate con lo spago. Il custode dice che le porta il notaio, ogni mattina, all'alba.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G3Municipio
  set evMunicipio = true
  # **Il notaio al catasto**
  > All'ufficio del catasto, nel municipio, incontri il notaio Ezra Pell. È venuto a depositare un atto, e aspetta il suo turno seduto su una panca, con il cappello sulle ginocchia. È magrissimo, tossisce, e porta i guanti anche al chiuso.
  if $libro:
    > Sotto il braccio ha un libro che riconosci: il *Saggio sulla duplice natura dell'uomo*, con la scheda della biblioteca che spunta tra le pagine.
  > Ti chiede, con un interesse che non riesce a nascondere, a che punto è il vostro antidoto.
  ! Che cosa fai?
  [[Gli dici a che punto siete. ~> dici]]
  [[Gli chiedi di firmarti una ricevuta. ~> firma]]
  [[Lo saluti e te ne vai. ~> vai]]
  fragment dici:
    set ezra = $ezra + 1
    > Ezra ascolta, annuisce, fa due domande precise sulla temperatura e sui tempi. Poi apre il portafoglio e ti dà del denaro "per le spese di laboratorio, in memoria di mio padre". Quando lo ringrazi, ti guarda come si guarda qualcuno che sta per partire.
    block setupEvent next=$hub:
      ! Guadagni $3.
  fragment firma:
    set grafia = true
    > Ezra si toglie un guanto, lentamente. Ha le dita macchiate d'inchiostro viola. Prende la penna con la destra e comincia a scrivere: una grafia diritta, ordinata, da notaio. A metà del suo nome la mano si irrigidisce, e le ultime lettere si piegano all'indietro. Ezra guarda il foglio, lo appallottola, se lo mette in tasca e se ne va senza aspettare il suo turno.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e 1VP.
  fragment vai:
    > Lo saluti e te ne vai. Sulla soglia ti volti: Ezra Pell è ancora sulla panca, a fissare il vuoto, con le mani guantate strette intorno al cappello. Nel vetro della porta il suo riflesso è più piccolo di lui.
    block setupEvent next=$hub:
      ! Non succede niente.

:: G3Emporio
  set evEmporio = true
  # **Il magazzino di Lomax**
  > Gli eredi di Lomax svendono tutto quello che c'era nella vecchia farmacia: scatole, barattoli, bilancine, ricette ingiallite, cassetti interi di polveri senza etichetta. La roba è ammucchiata su un tavolo in fondo al General Store, e la gente ci fruga dentro come al mercato delle pulci.
  ! Che cosa fai?
  [[Compri tutto il cassetto delle polveri, per $3. ~> polveri]]
  [[Compri i registri della farmacia, per $2. ~> registri]]
  fragment polveri:
    set variante = either(1, 2)
    if $polvere || $variante == 1:
      > In fondo al cassetto, dentro una bustina di carta ripiegata con cura, c'è un pizzico di polvere grigia. Non sa di niente. Nel laboratorio, sciolta con il sale nuovo, porta il colore dal viola al verde, per un istante, prima di tornare indietro. È poca. Ma è lei.
      if $antidoto < 3:
        block setupEvent next=G3Antidoto:
          ! Paga $3. L'antidoto fa un passo avanti: rimettete nella scatola uno dei Collaborative Experiment non ancora completati.
      else:
        block setupEvent next=$hub:
          ! Paga $3 e guadagni 2VP.
    else:
      > Nel cassetto ci sono polveri di ogni colore: bianche, gialle, rosa, una perfino blu. Grigie, nessuna. Le porti a casa lo stesso. Qualcuna, almeno, serve.
      block setupEvent next=$hub:
        ! Paga $3. Guadagni 2 {icon:Chemical_Icon}.
  fragment registri:
    > Sono dodici volumi rilegati in tela, umidi di cantina. Nel quarto, alla data del 9 novembre 1859, c'è la riga cancellata che conosci, o di cui hai sentito parlare. Con la lente e una candela dietro la pagina, l'inchiostro sotto la cancellatura si legge ancora: *polvere grigia, dalla credenza di S. P.*
    block setupEvent next=$hub:
      ! Paga $2. Guadagni 1 Conoscenza Chimica (Chemistry Knowledge).

// Terzo colpo di scena: il sale "buono" era un furto.
:: G3Lomax
  # **Il farmacista**
  ! **Deposizione di Lomax, farmacista, in punto di morte – raccolta dal notaio Ezra Pell, *1912.***
  > Il sale di quella prima partita era mio, ma non era puro. Il vecchio della tenuta venne in farmacia una sera d'inverno, con una boccetta di polvere grigia, e mi chiese di mescolarla al sale: un cucchiaino per boccetta, e di non scriverlo nel registro. Mi pagò per non scriverlo: abbastanza da comprare la farmacia due volte, e il mio silenzio per più di cinquant'anni.

  > Gli chiesi da dove venisse quella polvere. Mi disse che l'aveva presa dalla credenza di un amico, un uomo di legge che da giovane aveva studiato da speziale e teneva le sue polveri sotto chiave; e che l'amico non doveva saperlo. Il notaio. Vostro padre, signor Pell. Il sale buono non è mai stato una scoperta del vecchio: era un furto.

  > Una boccetta di quella partita l'ho tenuta io. Una sola, per cinquant'anni, in fondo al cassetto. Non l'ho mai aperta. Prendetela voi, e fatene quello che volete: io non ne voglio sapere più niente.
  ! **Nota del notaio Ezra Pell.**
  > Ho trascritto queste parole con la mano ferma. È stata l'ultima volta.
  [[Clicca per continuare... => G3DoseOfferta]]

:: G3DoseOfferta
  # **L'ultima dose pura**
  ui specialEvent
  ! Ogni giocatore prende in mano in segreto quanto denaro vuole offrire per l'ultima dose del sale impuro, anche niente. Quando tutti sono pronti, rivelate insieme le offerte.
  [[Clicca per iniziare l'offerta... ~> 0]]
  fragment 0:
    ui bidding next="G3DoseEsito" mode="Bidding"

:: G3DoseEsito
  # **Chi la prende?**
  ! Chi ha offerto di più *(in caso di parità vince, tra i pari, il primo in ordine di turno; se nessuno ha offerto niente, nessuno)*?
  [[{$nameA} ~> a]]
  [[{$nameB} ~> b]]
  if $players > 2:
    [[{$nameC} ~> c]]
  if $players > 3:
    [[{$nameD} ~> d]]
  [[Nessuno. ~> nessuno]]
  fragment a:
    set dose = $nameA
    goto G3DosePresa
  fragment b:
    set dose = $nameB
    goto G3DosePresa
  fragment c:
    set dose = $nameC
    goto G3DosePresa
  fragment d:
    set dose = $nameD
    goto G3DosePresa
  fragment nessuno:
    set dose = ""
    goto G3DosePresa

:: G3DosePresa
  # **La boccetta**
  if $dose != "":
    > Lomax muore la notte stessa, con le mani giunte. La boccetta passa a {$dose}, che la avvolge in un fazzoletto e la mette nella tasca interna della giacca, sopra il cuore. Pesa più di quanto dovrebbe.
    block setupEvent next=G3Cronaca1:
      set _SetupImage = "S2_RehabilitationToken"
      ! **{$dose}** paga la propria offerta e prende il **Rehabilitation token** {icon:S2_RehabilitationToken} dalla Scatola di **Fear of the Unknown**: è l'ultima dose pura. Gli altri riprendono le loro offerte.
  else:
    > Nessuno la vuole. Lomax muore la notte stessa, con la boccetta stretta in mano; quando l'infermiera prova a togliergliela, le dita non si aprono. Lo seppelliscono così. L'indomani, sulla sua tomba, qualcuno ha lasciato un fiore e un assegno.
    block setupEvent next=G3Cronaca1:
      ! Le offerte tornano ai giocatori.

:: G3Cronaca1
  # **Le due prime pagine**
  ! **Dai due giornali della città – *1912.***
  > Il giornale liberale e quello conservatore, per una volta, escono con la stessa notizia in prima pagina: è morto il farmacista Lomax, l'uomo del sale. Le due versioni, naturalmente, non coincidono. Per il giornale liberale era un piccolo commerciante schiacciato dai potenti; per quello conservatore, un avvelenatore graziato dalla vecchiaia.
  if $stampa == "venduta":
    > Tutti e due ricordano, nell'articolo, la "sorprendente intervista" concessa mesi fa da un erede della tenuta, che ha raccontato la storia del sale a entrambi i giornali, facendosi pagare due volte. Tutti e due la definiscono "illuminante".
  elif $stampa == "liberale":
    > Il giornale liberale ricorda di aver sempre sostenuto che Umber fosse un ricco annoiato. Il giornale conservatore ricorda di aver sempre sostenuto che il giornale liberale fosse pagato dalla tenuta.
  elif $stampa == "conservatore":
    > Il giornale conservatore ricorda con orgoglio i rastrellamenti nei dormitori della stazione, che "hanno riportato l'ordine". Il giornale liberale ricorda che nessuno degli arrestati era Umber.
  if $madre:
    > In seconda pagina, una lettera al direttore di una madre il cui figlio è ricoverato nel reparto dei signori: ringrazia "una famiglia della città" che le ha promesso una cura. La lettera è firmata soltanto con le iniziali.
  if $evArchivio:
    > La Library annuncia con soddisfazione di aver catalogato l'archivio del defunto notaio Silas Pell, donato dal figlio. Il catalogo è a disposizione del pubblico. Manca, si precisa, l'anno 1861.
  if $evFabbro:
    > Nella cronaca, un trafiletto: il vecchio fabbro della città ha chiuso bottega ed è andato a vivere dalla figlia. Dice che negli ultimi tempi troppa gente gli chiedeva di una chiave "molto antica e molto strana".
  [[Continua... => G3R2]]

:: G3R2 [HUB]
  # **IL SALE IMPURO – Maturità**
  set round = 8
  if $hub != "G3R2":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $arrestato:
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 8**: l'innocente è ancora in Jail.
      else:
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 20**.
  set hub = "G3R2"
  include Traguardi
  include VociG3
  if !$evIstituto:
    if $arrestato:
      block hubTitle:
        ! {icon:Storybook} **Il prigioniero – Jail**
      block hubDetails:
        ! Il primo giocatore che manda un suo pezzo alla Jail, a trovare il parente ancora in cella, [[clicca qui. -> G3Prigioniero]]
    else:
      block hubTitle:
        ! {icon:Storybook} **L'offerta dei professori – Memorial Institute**
      block hubDetails:
        ! Il primo giocatore che manda un suo pezzo al Memorial Institute [[clicca qui. -> G3Istituto]]
  if !$evStatua:
    block hubTitle:
      ! {icon:Storybook} **La statua – Foundry**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Foundry [[clicca qui. -> G3Statua]]
  if !$evPatto3 && $patto > 0:
    block hubTitle:
      ! {icon:Storybook} **L'assegno in bianco – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G3Patto]]
  if !$evFuneraleLomax:
    block hubTitle:
      ! {icon:Storybook} **Il funerale del farmacista – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G3FuneraleLomax]]
  if !$evBanca3:
    block hubTitle:
      ! {icon:Storybook} **Il conto del vecchio – Bank**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Bank [[clicca qui. -> G3Banca]]
  if !$evNell:
    block hubTitle:
      ! {icon:Storybook} **Un funerale – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G3Nell]]
  block hubTitle:
    ! **Evento del secondo Round**
  block hubDetails:
    > L'Istituto di scienze sulla collina ha cambiato idea: adesso offre una fortuna per la formula del sale, e una cattedra a chi la porta. I professori vengono alla tenuta in automobile, con i guanti.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G3R2" next="G3Cronaca2"

::round G3R2 8
fine: La Maturità della Terza Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Vecchiaia prima di continuare.

:: G3Cronaca2
  # **Una lettera di Ada**
  ! **Lettera di Ada Haskett, ispettore in pensione, alla famiglia della tenuta – *1913.***
  if $ada > 0 || $haskett > 0:
    > Cari amici, perché ormai posso chiamarvi così: vi scrivo perché ho bisogno di dirlo a qualcuno, e mia zia non c'è più.
  else:
    > Signori, non siamo mai stati amici, e non fingerò di esserlo adesso. Vi scrivo perché non ho nessun altro a cui scrivere, e perché quello che ho da dire riguarda voi più di chiunque altro.
  > Sono cinquantadue anni che la mia famiglia dà la caccia a Mr. Umber. Mia zia ha cominciato quando era più giovane di quanto io sia adesso; io ho continuato quando lei non ce la faceva più. Abbiamo fermato quaranta uomini bassi e qualche innocente, e abbiamo chiuso più di un fascicolo per stanchezza. Non abbiamo mai preso lui.
  if $evStatua:
    > Avete visto la statua del vecchio, in piazza? Tutti dicono che gli somiglia. Io non l'ho mai visto, il vecchio. Ma passandoci davanti, di notte, ho avuto l'impressione che la statua somigliasse a qualcun altro.
  if $taccuino:
    > Il taccuino della zia, che vi ho lasciato leggere al cimitero, l'ho riletto anch'io, tutto, di notte. L'ultima pagina su Umber l'ho letta tre volte. Credo che lei avesse capito, alla fine, e che non abbia avuto il coraggio di scriverlo per intero.
  if $inchiostro:
    > So che uno di voi è andato alla Bank a vedere l'ultimo assegno del vecchio conto. Inchiostro viola, vero? Anche io l'ho visto. Ci sono pochi posti, in questa città, dove si usa quell'inchiostro.
  if $testimone:
    > So anche che siete andati a trovare il vostro parente in cella, e che vi ha parlato del vecchio signore con la borsa di cuoio. A me non l'aveva mai detto. Forse non gliel'ho mai chiesto nel modo giusto.
  > Non ho più il distintivo, e non ho più l'età. Ma se un giorno doveste avere bisogno di qualcuno che sappia ascoltare, sapete dove abito. Ada Haskett.
  [[Continua... => G3Notte]]

:: G3Notte
  # **L'ultima notte si avvicina**
  > I giornali, per una volta d'accordo, annunciano il temporale più forte degli ultimi cinquant'anni. Quel pomeriggio arriva alla tenuta un biglietto del notaio Ezra Pell, in una grafia così tremante che si legge a fatica: chiede di vedere tutta la famiglia, la sera del temporale, nello studio con due porte. Porterà il testamento.
  ! Che cosa fate? *(Decidete insieme.)*
  [[Accettate, e lo aspettate alla tenuta. ~> accetta]]
  [[Chiedete ad Ada Haskett di essere presente. ~> ada]]
  [[Prima di rispondere, passate dal suo studio. ~> studio]]
  fragment accetta:
    set notte = "accetta"
    > Rispondete con un biglietto di due righe: la famiglia lo aspetta. Il commesso dello studio lo ritira alla porta e se ne va senza aspettare la mancia.
    block setupEvent next=G3R3:
      ! Non succede niente.
  fragment ada:
    if $ada > 0 || $haskett > 0:
      set notte = "ada"
      > Ada Haskett, ormai in pensione, accetta subito. "Mia zia diceva che quel notaio non le era mai piaciuto", dice. "Non sapeva dire perché. Ci sarò."
      block setupEvent next=G3R3:
        ! Ada Haskett sarà presente all'ultima notte.
    else:
      set notte = "accetta"
      > Ada Haskett vi fa rispondere dalla sua governante: è in pensione, e la vostra famiglia non è mai stata gentile con la sua. La sera del temporale resterà a casa.
      block setupEvent next=G3R3:
        ! Non succede niente.
  fragment studio:
    set notte = "studio"
    set studio = true
    > Passate dallo studio Pell nel pomeriggio, con una scusa. Il notaio non c'è; il commesso vi fa aspettare nella stanza delle pratiche. In un angolo c'è una vecchia credenza di noce, con le ante aperte. Dentro non c'è niente, tranne un odore amaro e una patina grigia sui ripiani.
    block setupEvent next=G3R3:
      ! Ogni giocatore guadagna 1 {icon:Insanity_Icon}.

:: G3R3 [HUB]
  # **IL SALE IMPURO – Vecchiaia**
  set round = 9
  if $hub != "G3R3":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $umber == "preso":
        ! Aprite la Village Chronicle alla sezione **A Time of War** ({icon:S3_ScenarioIcon}) e andate a **pagina 16**: la città di giorno.
      else:
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 21**: la notte.
  set hub = "G3R3"
  include Traguardi
  include VociG3
  if !$evMunicipio:
    block hubTitle:
      ! {icon:Storybook} **Il notaio al catasto – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G3Municipio]]
  if !$evRecita:
    block hubTitle:
      ! {icon:Storybook} **L'ultima recita – Traveling Caravan**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Traveling Caravan [[clicca qui. -> G3Recita]]
  if !$evTomba3:
    block hubTitle:
      ! {icon:Storybook} **La tomba del vecchio – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G3Tomba]]
  if !$evEmporio:
    block hubTitle:
      ! {icon:Storybook} **Il magazzino di Lomax – General Store**
    block hubDetails:
      ! Gli eredi di Lomax svendono il magazzino della farmacia. Il primo giocatore che manda un suo pezzo al General Store [[clicca qui. -> G3Emporio]]
  block hubTitle:
    ! {icon:Storybook} **Il venditore di specchi – Farmer's Market**
  block hubDetails:
    ! Quando un tuo pezzo visita il Farmer's Market, puoi pagare $1 e guardarti in uno specchio: [[clicca qui. -> G3Specchi]]
  block hubTitle:
    ! **Fine della Generazione**
  block hubDetails:
    > Il cielo sopra la città è basso e giallo. In ogni casa si chiudono le imposte. Stanotte il notaio leggerà il testamento per l'ultima volta.
  [[Clicca qui alla Fine della Generazione per continuare... ~> 0]]
  fragment 0:
    ui endOfRound progress="G3R3" next="G3Dose"

::round G3R3 0
fine: La Vecchiaia della Terza Generazione è finita.
poi: Eseguite le azioni di Fine Round, poi continuate con lo Storybook prima della Fine della Generazione.

// Chi ha l'ultima dose pura decide per primo, in segreto.
:: G3Dose
  if $dose == "":
    goto G3UltimaNotte
  @@ **Passa lo Storybook a {$dose}.**
  # **L'ultima dose**
  > Prima che arrivi il notaio ti chiudi in bagno con la boccetta di Lomax e un bicchiere d'acqua. Rompi la ceralacca. Il sale è bianco, fine come zucchero, con un riflesso giallognolo quando lo guardi controluce. Ti torna in mente, chissà da dove, una frase che non hai mai letto: *una sola sorsata. Poi la porta.*

  > Nessuno saprà che cosa hai scelto, finché non sarà troppo tardi per cambiarlo.
  [[La bevi. ~> bevi]]
  [[La conservi. ~> no]]
  fragment bevi:
    set scelta = "bere"
    goto Punteggio
  fragment no:
    goto G3UltimaNotte

:: G3UltimaNotte
  # **L'ultima notte**
  > Il temporale arriva al tramonto. La famiglia è riunita nello studio con due porte, tra gli specchi del vecchio, e la luce elettrica va e viene. Il notaio Ezra Pell è in piedi accanto al camino, con il cappotto bagnato e il testamento in mano. È invecchiato tutto d'un colpo, come chi non dorme da anni.

  > "Le circostanze sono dubbie da cinquant'anni", dice. "Il testamento mi obbliga a consegnare tutto a Mr. Umber. Prima di farlo, voglio sapere da voi che cosa devo fare." Fuori un tuono fa tremare i vetri, e per un momento, in tutti gli specchi, il notaio sembra più piccolo.
  if $cappotto == "appeso":
    > Il cappotto nero è appeso all'attaccapanni dell'ingresso, dove lo avete messo. Il notaio, entrando, ci appende il suo cappello, senza pensarci, come si fa a casa propria.
  if $notte == "ada":
    > In un angolo, seduta, c'è Ada Haskett, in pensione ma con il taccuino della zia sulle ginocchia. Il notaio la saluta con un inchino, e da quel momento non le volta più le spalle.
  include ContaIndizi
  if $indizi >= 3:
    > Nessuno di voi lo dice ad alta voce. Ma mentre il notaio parla, tutti guardate le sue mani, e i guanti che non toglie mai. Ognuno di voi, in questi anni, ha visto qualcosa: una firma, un inchiostro, un nome su una scheda, una porta aperta. Presi uno per uno, non vogliono dire niente. Messi insieme, fanno una persona sola. E negli specchi, per un momento, tutti vedete la stessa cosa.
  elif $indizi >= 1:
    > Qualcuno di voi, chissà perché, non riesce a smettere di guardare le mani del notaio.
  if $antidoto >= 3:
    [[Clicca per continuare... => G3VotoAntidoto]]
  elif $umber != "preso" && $ombra != "":
    [[Clicca per continuare... => G3VotoConfessione]]
  else:
    [[Clicca per continuare... => G3VotoTestamento]]

:: G3VotoAntidoto
  # **L'antidoto**
  ui specialEvent
  > Sul tavolo c'è l'antidoto, un bicchiere per ciascuno. Il notaio lo guarda come si guarda un'arma.
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: bevete l'antidoto, tutti, e Umber sparisce per sempre.
  ! NAY: riconoscete Umber come erede, come vuole il testamento.
  if $ombra != "" && $umber != "preso":
    ! *Il voto dell'Erede nell'Ombra, che si è rivelato all'inizio della Generazione, vale doppio.*
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G3EsitoAntidoto" mode="Voting"

:: G3EsitoAntidoto
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Curare. (YAY) ~> si]]
  [[Riconoscere Umber. (NAY) ~> no]]
  fragment si:
    set scelta = "curare"
    goto Punteggio
  fragment no:
    set scelta = "riconoscere"
    goto Punteggio

:: G3VotoConfessione
  # **La confessione**
  ui specialEvent
  > I cronisti dei due giornali aspettano fuori dal cancello, sotto la pioggia. Basterebbe aprire la porta e raccontare tutto.
  if $stampa == "venduta":
    > Metà della storia, del resto, la sanno già: gliel'avete venduta voi.
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: la famiglia confessa tutto, in pubblico.
  ! NAY: la famiglia tace, e sigilla i documenti.
  if $ombra != "" && $umber != "preso":
    ! *Il voto dell'Erede nell'Ombra, che si è rivelato all'inizio della Generazione, vale doppio.*
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G3EsitoConfessione" mode="Voting"

:: G3EsitoConfessione
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Confessare. (YAY) ~> si]]
  [[Tacere. (NAY) ~> no]]
  fragment si:
    set scelta = "confessare"
    goto Punteggio
  fragment no:
    set scelta = "tacere"
    goto Punteggio

:: G3VotoTestamento
  # **Il testamento**
  ui specialEvent
  > Il notaio apre il testamento sul tavolo, alla pagina della clausola. La mano gli trema tanto che deve tenerla ferma con l'altra.
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: il notaio esegue la clausola: tutto a Mr. Umber.
  ! NAY: il testamento viene impugnato, e i documenti sigillati.
  if $ombra != "" && $umber != "preso":
    ! *Il voto dell'Erede nell'Ombra, che si è rivelato all'inizio della Generazione, vale doppio.*
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G3EsitoTestamento" mode="Voting"

:: G3EsitoTestamento
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Riconoscere Umber. (YAY) ~> si]]
  [[Impugnare il testamento. (NAY) ~> no]]
  fragment si:
    set scelta = "riconoscere"
    goto Punteggio
  fragment no:
    set scelta = "tacere"
    goto Punteggio

// Quanti indizi sul notaio ha raccolto la famiglia.
:: ContaIndizi
  set indizi = 0
  if $conto:
    set indizi = $indizi + 1
  if $libro:
    set indizi = $indizi + 1
  if $testimone:
    set indizi = $indizi + 1
  if $inchiostro:
    set indizi = $indizi + 1
  if $taccuino:
    set indizi = $indizi + 1
  if $specchio:
    set indizi = $indizi + 1
  if $grafia:
    set indizi = $indizi + 1
  if $lettera:
    set indizi = $indizi + 1
  if $fabbro:
    set indizi = $indizi + 1
  if $studio:
    set indizi = $indizi + 1

:: Punteggio [END]
  # **Punteggio**
  block setup list=items:
    ! Ogni Miglioria della Tenuta vale 1VP.
    ! Aggiungete i punti delle Migliorie Vanity della Tenuta.
    ! -3VP per ogni Maladjustment ricevuto alla Fine di questa Generazione.
    ! Chi ha il Masterwork **Love Potion** e non l'ha completato perde 5VP.
    ! IL GIOCATORE CON PIÙ PUNTI VINCE LA PARTITA.
  [[Clicca per registrare i punteggi per i posteri... ~> 0]]
  fragment 0:
    ui scoreEntry next="SceltaFinale"

:: SceltaFinale
  set winner = $winnerName
  ui generationEndingContinue enabled=true
  if $umber == "preso" && $sospetto >= 8:
    goto FinaleForca
  elif $ombraNuovo:
    goto FinaleSpecchio
  elif $nuovi >= $players * 2:
    goto FinaleCitta
  elif $scelta == "bere":
    goto FinaleRitorno
  elif $scelta == "curare":
    goto FinaleSalePuro
  elif $scelta == "riconoscere":
    goto FinaleDoppio
  elif $scelta == "confessare":
    goto FinaleConfessione
  else:
    goto FinaleLettera
