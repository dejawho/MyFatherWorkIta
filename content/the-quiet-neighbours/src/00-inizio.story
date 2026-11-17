// I Vicini Silenziosi – preparazione, prologo e pagine comuni.
// Design: docs/custom/the-quiet-neighbours/design.it.md.
// Testo italiano completo, rivisto per coerenza.

::vars
round = 0
// L'hub del Round in corso: le pagine comuni ci tornano.
hub = ""
caso = ""
tracker = 0
// Chi gioca la pagina (una lettera) e il suo nome, dove continua ChiSei, il vincitore, l'ultima scelta.
chi = ""
nomeChi = ""
dopo = ""
scelta = ""
// Lo stato della storia (design, sezione 5).
vicini = 0
fiducia = 0
ronda = 0
// I Vicini (Wooden Figure token) e l'acqua scura (Paradox token) sul tabellone in questo momento.
figure = 0
pozzi = 0
// La pietra (Crown token): "torbiera" o "famiglia" (con chi la tiene) o "spezzata".
pietra = "torbiera"
pietraChi = ""
pietraNome = ""
// La Macchina (Teleportation): chi la tiene, e se è riparata.
macchina = ""
macchinaNome = ""
riparata = false
// Le carte messe da parte, già consegnate.
primaAcqua = false
crisi = false
primoTest = false
// La vanga (Sickle token) e la Ronda (Shield token): il nome di chi li tiene.
vanga = ""
scudo = ""
scudoUsato = false
// Fokke Tammer, dopo lo scavo: "svegliato" o "sepolto".
fokke = ""
// La Copia (una lettera, o nessuno), se il test l'ha trovata, se torna nella torbiera.
// Per sceglierla: il massimo di acqua bevuta, quanti pari, un appoggio.
copia = ""
copiaNome = ""
massimo = 0
pari = 0
tmp = 0
smascherata = false
reduce = false
// Dove la Copia mette un Vicino, la notte.
notteLuogo = ""
// Il Luogo dove PosaVicino mette un Vicino.
luogo = ""
// Prima Generazione: le scelte che tornano più avanti.
cane = ""
hester = false
tomba = ""
carovana = ""
torre = false
chiave = false
kalf = 0
wessel = ""
scheggia = false
disegni = false
piet = ""
evTomba = false
evCarovana = false
evFabbro = false
evFosse = false
evFonderia = false
evApprendista = false
// Seconda Generazione: le scelte che tornano più avanti.
joost = 0
consiglio = ""
evPiet = false
evMulder = false
evBanco = false
evApprendista2 = false
evPastore2 = false
evMacerie = false
// Terza Generazione: gli eventi in più.
corrente = false
evMonumento = false
evTecnico = false
evReport = false
evNeeltje = false
evEmporio = false
evMercato = false
// Arricchimento: eventi e scelte in più.
evMugnaio = false
evWessel1 = false
evGhiaccio = false
evNozze = false
evBagno = false
evCassa = false
evPastore3 = false
nozze = ""
evLambert = false
mugnaio = ""
lambert = false
evWessel2 = false
evSiebe = false
evMostra = false
evCarovana3 = false
segreto = ""
kees = false
// Il finale raggiunto (per l'epilogo comune).
finale = ""
// Gli eventi dei Luoghi già giocati (ognuno una volta sola).
evFokke = false
evCane = false
evLevatrice = false
evTorre = false
evMani = false
evPozzo = false
evPastore = false
evBanca = false
evLibri = false
evSindaco = false
evScuola = false
evRonda = false
evVanga = false
evRovine = false
evCoro = false
evFurto = false
evRespiro = false
evScavo = false
evGerrit = false
evJoost = false
evFesta = false
evBram = false
evLavori = false
evWil = false
evGiornali = false
evPietra3 = false
evHendrik = false
evCoprifuoco = false
evUltimi = false
// I traguardi degli Storybook token, uno per tipo e Generazione.
tkCreepy = false
tkInsanity = false
tkBiology = false
tkVP = false
// Per giocatore: quante volte ha bevuto l'acqua scura, e se il medico l'ha già esaminato.
::for L in A B C D
acqua%L% = 0
testato%L% = false
::endfor

:: Preparativi [Begins-Here]
  # **Preparativi**
  ! Completate la preparazione standard per {$players} giocatori come indicato nel regolamento, con le eccezioni qui sotto. *Nota: il tracciato {icon:AngryMob_Icon} e il Primo Giocatore verranno stabiliti dallo Storybook nelle prossime pagine.*

  ! Prima di mescolare i mazzi, **mettete da parte**, scoperte accanto al tabellone:
  ! • il Masterwork Experiment **Teleportation**, prima di distribuire i Masterwork;
  ! • le Compulsion **"They'll never understand…"** (*Must collect Occult Knowledge*), **"Swing wide the iron gate!…"** (*Must collect a Body*), **"The flora of this region…"** (*Must collect a Chemical*) e **"I will observe these sniveling fools…"** (*Must visit the Town Hall*);
  ! • i Maladjustment **Existential Crisis** e **Must Be Loved**.

  ! {icon:ScenarioBox3D_War}
  ! Questo scenario non ufficiale usa alcuni componenti della Scatola dello Scenario **A Time of War**. Tenetela a portata di mano, ma **non apritela**: lo Storybook vi dirà di volta in volta quali componenti prendere. Tutti gli altri devono restare nella scatola, nascosti.

  [[Clicca qui per continuare... => VSPrologo]]

:: VSPrologo [voice]
  # **Il Registro Maas**
  ! **Lettera della dottoressa Wil Maas – *autunno 1919.***
  > Agli eredi della tenuta, prima che decidano.

  > Vi mando il Registro della mia famiglia: tre quaderni rilegati in tela nera, cinquantaquattro anni di parti, febbri, ossa rotte e temperature. Lo ha cominciato mia nonna Hester, che era levatrice e non ebbe mai il permesso di chiamarsi dottore; lo ha continuato mio padre Joost, che il permesso lo ebbe e non ci credette mai; lo chiudo io, che ho fatto quattro anni di guerra e credo ormai a quasi tutto.

  > Non vi chiedo di credermi. Vi chiedo di contare. Contate le temperature troppo basse, le guarigioni troppo rapide, i nomi che tornano due volte. Contate le persone del paese che non hanno più sognato. Poi decidete.

  ! **Registro Maas – Hester Maas, levatrice, *11 novembre 1865.***
  > Notte, ore undici e un quarto. Di ritorno dal parto della moglie del mugnaio, maschio, sano. Dalla strada dell'argine vista una luce bianca sulla torre della tenuta, forte come il giorno, senza fumo né rumore. Nello stesso istante, lo giuro, un'altra luce uguale in mezzo alla torbiera, dove non c'è niente e nessuno. Durate il tempo di un respiro. Poi buio.

  > Mattina. Medicate le mani di Fokke Tammer, torbaio: bruciature di secondo grado sui palmi. Dice di aver trovato nell'acqua, dove c'era la luce, una pietra nera calda come una stufa, e di averla tirata fuori. Non vuole dire dove l'ha messa.

  ! ***3 marzo 1866.***
  > Morto stanotte il signore della tenuta, cuore. Chiamata troppo tardi. Negli ultimi giorni non dormiva e parlava molto, sempre della torre. Mi ha stretto il polso fino a farmi male: "È passato qualcosa. Non so che cosa. Deve tornare da dove viene." Il pastore Kalf dice che delirava. Annoto qui le sue parole perché me l'ha chiesto lui, e perché nessun altro lo farà.
  [[Clicca per continuare... => VSG1Intro]]

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

// Chi gioca la pagina. Imposta $chi (una lettera) e $nomeChi, poi continua con $dopo.
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
    set nomeChi = $nameA
    goto $dopo
  fragment b:
    set chi = "B"
    set nomeChi = $nameB
    goto $dopo
  fragment c:
    set chi = "C"
    set nomeChi = $nameC
    goto $dopo
  fragment d:
    set chi = "D"
    set nomeChi = $nameD
    goto $dopo

// Le voci dell'hub che valgono in ogni Round: traguardi, acqua scura, Vicini, la Macchina.
:: VociComuni
  include Traguardi
  if $pozzi > 0:
    block hubTitle:
      ! {icon:S3_ParadoxToken} **L'acqua scura**
    block hubDetails:
      ! Quando un tuo pezzo visita un Luogo con un token {icon:S3_ParadoxToken}, prima di prendere l'azione puoi bere l'acqua scura: [[clicca qui. -> BeviChi]]
  if $figure > 0:
    block hubTitle:
      ! {icon:S3_WoodenFigureToken} **I Vicini**
    block hubDetails:
      ! Chi visita un Luogo con un Vicino {icon:S3_WoodenFigureToken} prende l'azione come sempre, ma a fine Round guadagna 1 {icon:Creepy_Icon}. Può invece spendere 2 Prove {icon:S3_WeaponToken} per smascherarlo: [[clicca qui. -> Smaschera]]

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
  if !$tkBiology:
    block hubTitle:
      ! {icon:StorybookToken} **Journal Biology**
    block hubDetails:
      ! La prima volta che un giocatore raggiunge il Livello 2 del Journal Track Biology in questa Generazione, [[clicca qui. -> TkBiology]]
  if !$tkVP:
    block hubTitle:
      ! {icon:StorybookToken} **15VP**
    block hubDetails:
      ! La prima volta che un giocatore raggiunge 15VP in questa Generazione, [[clicca qui. -> TkVP]]

// Rimette i traguardi all'inizio di una Generazione.
:: AzzeraTraguardi
  set tkCreepy = false
  set tkInsanity = false
  set tkBiology = false
  set tkVP = false

:: PosaTraguardi
  set _SetupImage = "StorybookToken"
  ! **Prendete 4 token {icon:StorybookToken}.**
  ! Mettetene uno sulla **casella 3** del tracciato {icon:Creepy_Icon}, uno sulla **casella 3** del tracciato {icon:Insanity_Icon} e uno sulla **casella 15** del tracciato dei Punti Vittoria. Il quarto va in cima alla colonna del **Livello 2 del Journal Track Biology**: vale per tutti i giocatori.
  ! Quando il segnalino di un giocatore raggiunge uno di questi token, quel giocatore clicca sulla voce corrispondente nello Storybook e legge un messaggio. Poi il token torna nella riserva.

:: TkCreepy
  set tkCreepy = true
  # **Il vicino alla finestra**
  if $round <= 3:
    > Da qualche giorno, ogni mattina, la lavandaia Smit si ferma davanti al cancello della tenuta e ti saluta con la mano. Non l'aveva mai fatto, in trent'anni: la lavandaia Smit non saluta nessuno, e a te, l'anno scorso, aveva tirato dietro un secchio d'acqua sporca. Adesso sorride, e ti chiede come stai, e aspetta la risposta. Ha le mani rosse di freddo, dice, ma non le mette in tasca.
  elif $round <= 6:
    > Il vicino nuovo, quello che si è trasferito la primavera scorsa nella casa di fronte, ti porta una cesta di mele ogni domenica, e ogni domenica ti chiede se hai bisogno di qualcosa. Ripara le tegole senza che nessuno glielo chieda. Ha imparato il nome di tutti i tuoi cani. La sera resta alla finestra di fronte, con la lampada spenta, e guarda la tua.
  else:
    > Al ritorno dalla città trovi la tua casa pulita, i vetri lavati, la legna tagliata e impilata. Un biglietto sul tavolo, in una calligrafia rotonda e gentile: *Vi abbiamo trovati un po' trascurati. Non c'è di che. I vostri vicini.* La porta era chiusa a chiave. Le chiavi sono soltanto due, e tutte e due sono in tasca a te.
  ! Che cosa fai?
  [[Ricambi la gentilezza. ~> amico]]
  [[Chiudi le imposte. ~> chiudi]]
  fragment amico:
    set fiducia = $fiducia + 1
    > Ricambi: un saluto, un dolce, un invito a cena. Il vicino accetta tutto, ringrazia di tutto e non dimentica niente. Da quel giorno, in paese, la tua famiglia è "gente per bene", e i fornitori ti fanno credito.
    block setupEvent next=$hub:
      ! Guadagni $2. Rimetti il token {icon:StorybookToken} nella riserva.
  fragment chiudi:
    set fiducia = $fiducia - 1
    > Chiudi le imposte e tiri il chiavistello. Il vicino non bussa, non chiama, non si offende. Resta lì fino a sera, paziente, come chi sa aspettare. Quando finalmente se ne va, sul vetro della finestra resta l'impronta di una mano, appannata, che non svanisce per un'ora.
    block setupEvent next=$hub:
      ! Guadagni 1 Prova {icon:S3_WeaponToken}. Rimetti il token {icon:StorybookToken} nella riserva.

:: TkInsanity
  set tkInsanity = true
  # **Le mani fredde**
  if $round <= 3:
    > Ti svegli prima dell'alba con le mani gelate, come se le avessi tenute tutta la notte nell'acqua. Il letto è asciutto. La stanza è calda, il camino acceso. Le mani no: restano fredde e umide fino a mezzogiorno, e quando le annusi sanno di fumo di torba.
  elif $round <= 6:
    > Stringi la mano a un cliente, e lui la ritira di scatto. "Scusate", dice, "avete le mani gelate." Gli sorridi. Lui non ricambia. Tornando a casa ti guardi le dita alla luce di un lampione: sono bianche, pulite, ferme. Troppo ferme. Non tremano più nemmeno quando hai paura.
  else:
    > Al fronte, i medici dicevano che il freddo ai piedi era il primo segno della cancrena. A {$townname} il freddo comincia dalle mani. Stamattina hai scaldato una tazza di latte e l'hai tenuta stretta finché non si è raffreddata del tutto. Il latte. Le mani, no.
  ! Che cosa fai?
  [[Le scaldi al fuoco. ~> fuoco]]
  [[Vai dal medico ($1). ~> medico]]
  fragment fuoco:
    > Le tieni vicino alla fiamma finché la pelle non diventa rossa e comincia a far male. Il dolore è una buona notizia: vuol dire che sono ancora tue. La sera, scrivendo, ti sorprendi a controllare la temperatura dell'inchiostro.
    block setupEvent next=$hub:
      ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon}. Rimetti il token {icon:StorybookToken} nella riserva.
  fragment medico:
    > Il medico ti mette il termometro sotto il braccio, aspetta, guarda, e scrive un numero sul Registro senza dirtelo. Poi ti chiede se hai bevuto acqua della torbiera. Rispondi di no. Scrive anche quello.
    block setupEvent next=$hub:
      ! Paga $1 e guadagni 1 Prova {icon:S3_WeaponToken}. Rimetti il token {icon:StorybookToken} nella riserva.

:: TkBiology
  set tkBiology = true
  # **Il campione**
  if $round <= 3:
    > Hai messo sotto la lente un pugno di torba presa dall'argine, dove c'era la luce. Fibre, radici, semi neri, l'ala di un insetto morto chissà quando. Poi, mentre guardi, una delle fibre si muove. Si allunga verso la luce della lampada, piano, come un dito.
  elif $round <= 6:
    > Il microscopio nuovo, quello comprato in città, ingrandisce trecento volte. Nella goccia d'acqua scura ci sono cose che i libri non nominano: filamenti che si annodano e si sciolgono, in un ordine preciso. Se li guardi abbastanza a lungo, l'ordine ricorda una faccia. La tua.
  else:
    > Il laboratorio dell'University ti presta un apparecchio tedesco e un assistente che non fa domande. Sotto la lente, un frammento di Vicino, preso dalla torba della strada dove si è sbriciolato: le cellule sono perfette, ordinate, identiche a quelle di un uomo. Sono solo fatte di un'altra cosa.
  ! Che cosa fai?
  [[Studi il campione. ~> studia]]
  [[Lo bruci. ~> brucia]]
  fragment studia:
    set vicini = $vicini + 1
    > Lo studi per giorni, finché non lo conosci a memoria. Impari moltissimo. E hai l'impressione, assurda e precisa, che anche lui, nel frattempo, abbia imparato qualcosa su di te.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Biologica (Biology Knowledge) e 1 {icon:Insanity_Icon}. Rimetti il token {icon:StorybookToken} nella riserva.
  fragment brucia:
    > Lo bruci nel fornello. Brucia piano, senza fiamma, come brucia la torba, e manda un fumo dolciastro che resta nella stanza per una settimana. Quello che hai visto, però, te lo ricordi.
    block setupEvent next=$hub:
      ! Guadagni 1VP. Rimetti il token {icon:StorybookToken} nella riserva.

:: TkVP
  set tkVP = true
  # **Il posto d'onore**
  if $round <= 3:
    > Il sindaco Wessel ti invita al pranzo del consiglio, il primo giovedì del mese, e ti fa sedere alla sua destra. Si parla di torba, di argini, del prezzo del burro. Nessuno nomina le due luci. Al momento del dolce il sindaco alza il bicchiere "alla famiglia della tenuta, che porterà {$townname} nel futuro". Tutti bevono acqua.
  elif $round <= 6:
    > Il consiglio ti offre un seggio. Le sedute durano pochissimo: nessuno litiga, nessuno si oppone, i bilanci tornano al centesimo. Alla fine della prima seduta il segretario ti stringe la mano e ti dice che sei "proprio come loro". È un complimento, a {$townname}.
  else:
    > La città ti nomina presidente del comitato per il monumento ai caduti. Il bronzo è già ordinato, i nomi già scelti, l'inaugurazione già fissata. Ti chiedono soltanto una firma e un discorso. Nel discorso, ti pregano, nessuna parola sulla torbiera: "I nostri ragazzi sono tornati. Questo conta."
  ! Che cosa fai?
  [[Accetti. ~> accetta]]
  [[Rifiuti, gentilmente. ~> rifiuta]]
  fragment accetta:
    set fiducia = $fiducia + 1
    set vicini = $vicini + 1
    > Accetti, ringrazi, fai quello che ti chiedono. Ti accolgono come si accoglie chi è di famiglia, con una cordialità senza crepe. È piacevole. È così piacevole che, tornando a casa, devi fermarti un momento per ricordare che cosa volevi chiedere.
    block setupEvent next=$hub:
      ! Guadagni $2. Rimetti il token {icon:StorybookToken} nella riserva.
  fragment rifiuta:
    set fiducia = $fiducia - 1
    > Rifiuti, con tutte le buone maniere che hai. Nessuno si offende. A {$townname} non si offende più nessuno: ti sorridono, ti ringraziano lo stesso, e ti guardano andare via come si guarda un ospite che ha sbagliato casa.
    block setupEvent next=$hub:
      ! Guadagni 1VP. Rimetti il token {icon:StorybookToken} nella riserva.

// Bere l'acqua scura: una scelta pubblica (design, sezione 5). Torna all'hub.
:: BeviChi
  set dopo = "Bevi"
  goto ChiSei

:: Bevi
  # **L'acqua scura**
  if $round <= 3:
    > L'acqua della torbiera è scura come il tè lasciato in infusione troppo a lungo, e fredda anche d'estate. Chi l'ha bevuta dice che sa di fumo e di terra, e che schiarisce le idee meglio del caffè. Il pastore dice che è acqua del diavolo. Il pastore beve solo vino.
  elif $round <= 6:
    > A {$townname} l'acqua della torbiera si vende in bottiglie con l'etichetta, "Acqua di {$townname}, per la salute e la serenità". Il farmacista la consiglia contro l'insonnia, la maestra contro la distrazione, il sindaco contro tutto il resto. Nessuno, in paese, è più malato da anni.
  else:
    > Nel bicchiere l'acqua scura non si muove, nemmeno quando batti sul tavolo. Al fronte hai bevuto acqua di pozzanghera, di neve, di radiatore. Questa è diversa: ti guarda.
  ! *Chi beve guadagna conoscenza, ma tutti vedono quanta acqua ha bevuto, e il paese diventa più quieto.*
  [[Bevi. ~> si]]
  [[Non bevi. ~> no]]
  fragment si:
    set pozzi = $pozzi - 1
    set vicini = $vicini + 1
::for L in A B C D
    if $chi == "%L%":
      set acqua%L% = $acqua%L% + 1
::endfor
    > Il freddo scende fino allo stomaco e si allarga, lento, come inchiostro in un bicchiere. Poi arriva una chiarezza nuova: i pensieri si mettono in fila da soli, le preoccupazioni si fanno piccole e lontane. Per qualche ora non hai paura di niente. È la sensazione più piacevole che tu abbia mai provato, e questo, più di tutto il resto, ti spaventa.
    block setupEvent next=BeviEffetti:
      ! Guadagni subito 1 cubo di Conoscenza a scelta. Prendi il token {icon:S3_ParadoxToken} da quel Luogo e tienilo davanti a te: tutti devono vedere quanta acqua hai bevuto.
  fragment no:
    > Guardi il tuo riflesso nell'acqua scura, a lungo. Poi lasci il bicchiere dov'è. Mentre ti allontani hai l'impressione che il riflesso sia rimasto lì, a guardarti andare.
    block setupEvent next=$hub:
      ! Non succede niente.

// Le carte dell'acqua: la prima volta di tutti, la terza di ognuno.
:: BeviEffetti
  # **Dopo il sorso**
  if !$primaAcqua:
    set primaAcqua = true
    set _SetupImage = "CompulsionBack"
    ! Nessuno aveva bevuto l'acqua scura prima di te: prendi la Compulsion **"The flora of this region…"** messa da parte.
::for L in A B C D
  if $chi == "%L%" && $acqua%L% == 3 && !$crisi:
    set crisi = true
    set _SetupImage = "MaladjustmentBack"
    > Stamattina, allo specchio, hai dovuto pensarci un momento prima di riconoscerti. Solo un momento.
    ! È la terza volta che bevi: prendi il Maladjustment **Existential Crisis** messo da parte.
::endfor
  > Fuori, il paese ti sembra un po' più quieto di prima. O forse sei tu.
  [[Torna al Round. => $hub]]

// Lo Storybook mette un Vicino sul Luogo $luogo. Con 4 Vicini già sul tabellone, il paese cambia comunque.
:: PosaVicino
  set _SetupImage = "S3_WoodenFigureToken"
  if $figure >= 4:
    set vicini = $vicini + 2
    ! Non ci sono più Vicini {icon:S3_WoodenFigureToken} nella riserva: lasciate il tabellone com'è. Il paese è cambiato più di quanto si veda.
  else:
    set figure = $figure + 1
    ! Prendete un **Wooden Figure token** {icon:S3_WoodenFigureToken} dalla Scatola di **A Time of War** e mettetelo sul **{$luogo}**: è un **Vicino**.

// Smascherare un Vicino. Torna all'hub.
:: Smaschera
  # **Smascherato**
  if $round <= 3:
    > Gli prendi la mano davanti a tutti e la stringi forte, finché la pelle non si spacca. Dalla ferita non esce sangue: esce acqua scura, lenta, che sa di fumo.
  elif $round <= 6:
    > Davanti alla gente radunata gli mostri le Prove, una per una: la temperatura, la cicatrice che non c'è più, il nome che compare due volte nel Registro. Lui ascolta, gentile, senza negare niente.
  else:
    > Wil Maas gli punge il dito con un ago, davanti a tutti. Dalla puntura esce una goccia nera. Il Vicino la guarda, poi guarda te, e sorride come chi è stato scoperto a barare a carte.
  ! *Chi smaschera un Vicino spende 2 Prove {icon:S3_WeaponToken}.*
  [[Spendi 2 Prove. ~> si]]
  [[Lasci perdere. ~> no]]
  fragment si:
    set figure = $figure - 1
    set vicini = $vicini - 1
    set fiducia = $fiducia - 1
    > Il Vicino non scappa e non si difende. Si siede per terra, si guarda le mani, e comincia a perdere forma, come una statua di terra sotto la pioggia. In pochi minuti resta un mucchio di torba bagnata, con dentro un bottone e un paio di occhiali. Il paese guarda in silenzio. Nessuno ti ringrazia.
    block setupEvent next=$hub:
      ! Spendi 2 Prove {icon:S3_WeaponToken} e rimetti il Vicino {icon:S3_WoodenFigureToken} nella riserva. Guadagni 2VP.
  fragment no:
    > Lasci perdere. Il Vicino ti augura buona giornata, e lo dice sul serio.
    block setupEvent next=$hub:
      ! Non succede niente.

// A fine Round: chi ha la pietra ha sete. Poi la schermata di Fine Round.
:: SetePietra
::for L in A B C D
  if $pietra == "famiglia" && $pietraChi == "%L%":
    set acqua%L% = $acqua%L% + 1
::endfor

// Alla Fine di una Generazione i Vicini rimasti si confondono con il paese.
:: FineVicini
  set vicini = $vicini + $figure
  set figure = 0
  set pozzi = 0
