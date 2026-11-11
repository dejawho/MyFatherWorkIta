// Seconda Generazione – "La nebbia" (1873–1881).

// Pagina narrata: il testo è uguale per tutti (le varianti sono nella pagina dopo) e senza nomi.
:: G2Intro [INTRO voice]
  # **GENERAZIONE II: La nebbia**
  ! **Nota del dott. Halász al fascicolo.**
  > La seconda cassa si apre con un salto di diciassette anni. Le carte della prima generazione si fermano nel 1856; le successive cominciano nella primavera del 1873, quando i figli degli eredi presero possesso della tenuta, del laboratorio e del Journal, che nel frattempo era diventato due volumi e mezzo.

  > Il villaggio era cresciuto. Al posto delle case di legno c'erano case a graticcio con le travi dipinte, una strada lastricata, un ufficio postale, due locande e un medico. Il parroco era sempre Padre Anzelm, più vecchio e più magro, ma non meno ostinato. E c'era, scrive uno dei nuovi eredi in una lettera alla sorella, "questa cosa che qui chiamano il velo, come se fosse un fatto del tempo, come la pioggia o la nebbia".
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G2Antenati:
      include AzzeraTraguardi
      include PosaTraguardi
      ! Prendete dalla Scatola di **The Cost of Disease** le **Vanity Estate Upgrade** e aggiungetele a quelle disponibili.

:: G2Antenati
  # **La Seduta degli Antenati**
  if $madame == "ospite":
    > Madame Vámos non era invecchiata: così, almeno, giuravano tutti. Il Circolo dell'Ultima Ora non si nascondeva più. Aveva una sede in piazza, una banda per i funerali e duecento iscritti, e quell'anno comprò il terreno dietro il municipio per costruirci un tempio.
  else:
    > Della donna del carro restavano solo le storie, e un'abitudine curiosa: sulle porte delle case di {$townname} compariva ogni tanto un occhio disegnato con il carbone. Nessuno ammetteva di disegnarlo, nessuno lo cancellava. Il Circolo dell'Ultima Ora, si diceva, si riuniva ancora; ma non si sapeva dove, né chi ne facesse parte.

  > I colpi alle pareti erano cessati con l'ultimo funerale della prima generazione, e per diciassette anni la tenuta era stata una casa come le altre: fredda d'inverno, umida d'estate, piena di cose che nessuno osava buttare.

  > La prima notte che i nuovi eredi vi dormono, i colpi ricominciano. Ma questa volta, dopo i colpi, vengono le voci; e sono voci che ognuno di loro conosce benissimo, perché sono quelle di chi li ha messi al mondo.
  ! Ogni giocatore, a turno, legge il messaggio del proprio antenato senza mostrarlo agli altri. Può raccontarlo, mentire o tacere.
  [[Clicca per continuare... => G2AntA]]

// L'antenato risponde secondo quello che lo Storybook ha saputo alla fine della Prima Generazione.
::for L in A B C D | Fine
:: G2Ant%L%
  if %L.n% > $players:
    goto G2AntFine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **Una voce dall'altra parte**
  set voce = either(1, 2)
  if $ins1%L% >= 6:
    if $voce == 1:
      > La voce arriva prima dei colpi: un bisbiglio fitto, senza pause, che non saluta e non chiede come stai. Parla di formule, di proporzioni, di un errore nel terzo quaderno che va corretto subito, subito, prima che sia tardi. Riconosci la voce di chi ti ha messo al mondo, e riconosci anche il tono: è lo stesso delle notti in cui dal laboratorio non usciva nessuno.

      > "Finisci tu", ripete. "Finisci tu, finisci tu." All'alba hai la mano indolenzita e tre pagine fitte di una calligrafia che non è la tua.
    else:
      > Non sono colpi: è un ticchettio rapido e irregolare, come dita che tamburellano su un tavolo per l'impazienza. Poi la voce, febbrile, a metà di una frase cominciata chissà quando: "...e i numeri non tornano, non tornano mai, ma tu li farai tornare..."

      > Provi a chiedere se soffre. Non ti ascolta; non ti ha mai ascoltato. Quando il ticchettio smette, ti accorgi che stai tamburellando anche tu, con lo stesso ritmo, e non riesci a smettere.
    block setupEvent next=G2Ant%L.next%:
      set _SetupImage = "CompulsionBack"
      ! Pesca una carta Compulsion.
  elif $cuo1%L% >= 3:
    if $voce == 1:
      > Il colpo è uno solo, lieve, come una mano posata sulla porta. Poi la voce, calma, quasi divertita: ti chiede se mangi abbastanza, se il tetto della serra perde ancora, se ti ricordi della vedova del mugnaio. "Dille che sto bene", dice.

      > Capisci che non parla di sé. Parla di tutte le famiglie che ha consolato in vita, e che adesso, dall'altra parte, le fanno compagnia. Prima di andarsene ti benedice, come faceva quando partivi per un viaggio.
    else:
      > Nella stanza c'è profumo di pane caldo e di lavanda: l'odore della cucina della tenuta, tanti anni fa. La voce non bussa. Parla piano, come accanto al letto di un malato, e ti racconta che dall'altra parte non fa freddo, e che le persone consolate in vita sono venute ad accoglierla.

      > "Hai tempo", dice. "Usalo per i vivi." Al mattino, sul comodino, c'è qualcosa che la sera prima non c'era.
    block setupEvent next=G2Ant%L.next%:
      ! Guadagni $2 oppure 1 Conoscenza (Knowledge) a scelta.
  elif $patto%L%:
    set segreto%L% = true
    if $voce == 1:
      > La voce è bassa, guardinga, come chi parla in una stanza dove c'è qualcun altro. "Ascolta bene, perché non potrò ripeterlo. Tanti anni fa ho fatto una promessa al Circolo, a un uomo con un garofano nero. Credevo di aver venduto una cosa da niente. Mi sbagliavo."

      > Poi ti dice che cosa aveva promesso, parola per parola, e chi dovrà aprire la porta quando il Circolo busserà: tu. "Non dirlo a nessuno", conclude. "Ma ricordalo. Verrà il giorno in cui ti servirà sapere come si scioglie una promessa."
    else:
      > Prima della voce arriva l'odore: garofani e terra smossa. "Il Circolo ti tiene d'occhio", sussurra. "Tiene d'occhio tutti noi: chi ha firmato e chi è nato da chi ha firmato."

      > Ti racconta della busta, delle pagine scritte da una mano morta, della promessa di aprire una porta. Poi ti dice una cosa che il Circolo non sa che tu sai: la promessa vale per il sangue, ma il sangue può scegliere di non mantenerla. A un prezzo. Quale sia, non fa in tempo a dirlo: i colpi si interrompono a metà.
    block setupEvent next=G2Ant%L.next%:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge). Lo Storybook si ricorderà di questo segreto.
  elif $colpi%L% == "risposto":
    if $voce == 1:
      > Un colpo, due, uno: lo stesso ritmo che hai sentito raccontare mille volte, a tavola, dalla voce che adesso ti parla. "Quella notte risposi prima di tutti", dice. "La porta si è aperta un poco per me, e non si è più richiusa."

      > Poi, in fretta, come chi teme di essere interrotto, ti detta l'inizio di un esperimento che in vita non ebbe mai il coraggio di tentare. Scrivi finché la candela non si consuma.
    else:
      > La voce non perde tempo con i saluti. "Tu sai rispondere, vero? Una volta per sì, due per no. Te l'ho insegnato io, anche se non lo ricordi: battevo sulla parete della tua culla, e tu ridevi."

      > Un brivido. "Io risposi, la prima notte, e da allora di qua mi sentono tutti. Adesso sentono anche te." Quando la voce tace, sul tavolo c'è lo schema di un esperimento, e sulla parete della camera ci sono segni di nocche, piccoli, all'altezza di una culla.
    block setupEvent next=G2Ant%L.next%:
      ! Guadagni 1 {icon:Insanity_Icon} e pesca un Esperimento dal mazzo che preferisci.
  else:
    if $voce == 1:
      > Colpi lontani, irregolari, come di qualcuno che bussa in un'altra casa, in un'altra via. Rispondi: non succede niente. Chiami: il silenzio si fa più fitto.

      > Forse chi ti ha messo al mondo non vuole parlarti. Forse non può. Forse, pensi con un sollievo di cui ti vergogni un poco, sta semplicemente riposando in pace.
    else:
      > Aspetti fino all'alba con la candela accesa. Senti i colpi alle pareti delle altre camere, le voci attutite, un pianto, una risata. Alla tua parete, niente.

      > Solo verso le cinque arriva un colpo leggerissimo, uno solo, che potrebbe voler dire sì, oppure essere soltanto il legno che si assesta per il freddo.
    block setupEvent next=G2Ant%L.next%:
      ! Non succede niente.
::endfor

:: G2AntFine
  set voce = 1
  # **Il silenzio**
  > All'alba le voci tacciono. A colazione la famiglia è stranamente cortese: ci si passa il burro, si parla del tempo, si evita di guardarsi negli occhi.

  > Ognuno ha sentito qualcosa. Nessuno sa che cosa abbiano sentito gli altri. E tutti, almeno per un momento, hanno pensato di mentire.
  [[Continua... => G2R1]]

:: G2R1 [HUB]
  # **LA NEBBIA – Giovinezza**
  set round = 4
  if $hub != "G2R1":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $madame == "ospite":
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 4**.
      else:
        ! Aprite la Village Chronicle alla sezione **The Cost of Disease** ({icon:S1_ScenarioIcon}) e andate a **pagina 4**.
      include PreparaFolla
  set hub = "G2R1"
  include Traguardi
  if $madame == "ospite":
    block hubTitle:
      ! {icon:Storybook} **Il Tempio del Circolo – Construction Site**
    block hubDetails:
      ! Quando un tuo pezzo visita il Construction Site, paga $3 per finanziare il Tempio del Circolo e [[clicca qui. -> G2Tempio]]
  else:
    block hubTitle:
      ! {icon:Storybook} **La benedizione – Church**
    block hubDetails:
      ! Quando un tuo pezzo visita la Church, puoi pagare $2 per una messa per i tuoi morti: [[clicca qui. -> G2Messa]]
  block hubTitle:
    ! **Evento del primo Round**
  block hubDetails:
    > Nel secondo volume del Journal, tra una ricetta e un conto del maniscalco, c'è il disegno di una macchina per parlare con i morti.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G2R1" next="G2Telegrafo"

::round G2R1 4
fine: La Giovinezza della Seconda Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Maturità prima di continuare.

:: G2Tempio
  set fede = $fede + 1
  # **Il Tempio**
  > Paghi i muratori in contanti, davanti a tutti. Le fondamenta del Tempio crescono in fretta, più in fretta di quanto dovrebbero: i muratori dicono che di notte qualcuno lavora al posto loro, e che al mattino trovano le pietre già squadrate.

  > Madame Vámos passa a vedere il cantiere. Ti stringe la mano e ti chiama per nome davanti a tutti, come si fa con le persone di famiglia. Le vedove del Circolo, quella sera, accendono una candela per i tuoi morti.
  ! Guadagni 1 Charity token {icon:S1_HeartToken}.
  [[Torna al Round. => $hub]]

:: G2Messa
  set fede = $fede - 1
  # **La messa**
  > Il vecchio Padre Anzelm celebra una messa per i morti della tua famiglia, nella chiesa vuota, con un solo chierichetto che sbadiglia. Alla fine ti prende per un braccio, con una forza che non ti aspettavi. "Li ho seppelliti tutti, i tuoi", dice. "Lascia che restino dove li ho messi."

  > Quella notte, per la prima volta da mesi, nella tua camera non bussa nessuno, e dormi fino a giorno fatto.
  ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon}.
  [[Torna al Round. => $hub]]

:: G2Telegrafo
  # **Il Telegrafo dei Morti**
  include CasoGiocatore
  ! **Diario di {$caso} – *1875.***
  > Nel secondo volume del Journal, tra una ricetta per la conservazione dei tessuti e un conto del maniscalco, ho trovato il progetto. Tre tavole disegnate a china, con una cura che il nonno non dedicava a nient'altro. Lo chiama **Telegrafo dei Morti**.

  > Una batteria di vasi di vetro; chilometri di filo di rame avvolti intorno a un nucleo di ferro dolce; una tastiera di ventisei tasti d'osso; e al centro un ago sospeso in un'ampolla piena di un gas che lui chiama "aria del velo". Secondo i suoi calcoli i morti non parlano: modificano, appena un poco, la corrente. Basta un ago abbastanza sensibile per leggerli.

  > Ai margini della terza tavola c'è una nota a matita: *"Non ho avuto il tempo. Lo avranno loro."* Per costruire il primo stadio servono ingranaggi, molti più di quanti ne abbiamo in casa. Ognuno di noi dovrà decidere quanto lavoro sottrarre ai propri esperimenti.
  [[Clicca per continuare... => G2TelegrafoOfferta]]

:: G2TelegrafoOfferta
  # **Chi contribuisce?**
  ui specialEvent
  ! Ogni giocatore prende in mano in segreto quanti {icon:Gears_Icon} vuole offrire, anche nessuno. Quando tutti sono pronti, rivelate insieme le offerte.
  [[Clicca per iniziare l'offerta... ~> 0]]
  fragment 0:
    ui bidding next="G2TelegrafoEsito" mode="Bidding"

:: G2TelegrafoEsito
  # **Il primo filo**
  prompt contributi number: Quanti {icon:Gears_Icon} avete offerto in tutto?
  if $contributi >= $players:
    set apparato = $apparato + 1
    > Il primo stadio del Telegrafo occupa un'intera parete del laboratorio. La notte in cui lo accendono, i vasi di vetro ronzano, le lampade si abbassano in tutta la casa e l'ago, nell'ampolla, comincia a tremare.

    > Non è il tremito della corrente: è più lento, più ostinato, come un dito che cerca una lettera su una tastiera. Si ferma su un tasto d'osso. Poi su un altro. Prima che qualcuno riesca a leggere la parola, salta un fusibile, e nel buio, per un attimo, qualcuno ride.
    block setupEvent next=G2Nebbia:
      ! Gli {icon:Gears_Icon} offerti tornano nella riserva. Chi ha offerto di più guadagna 3VP (in caso di parità, tutti i pari).
  else:
    > Gli ingranaggi raccolti bastano appena per la base. Il progetto torna nel cassetto, sotto il secondo volume del Journal, e i pezzi tornano a chi li aveva offerti.

    > Quella notte i colpi alle pareti sono più lenti del solito, quasi strascicati. Se i morti possono essere delusi, lo sono.
    block setupEvent next=G2Nebbia:
      ! Gli {icon:Gears_Icon} offerti tornano ai giocatori.

:: G2Nebbia
  # **Scende la nebbia**
  ! **Gazzetta di {$townname} – *autunno 1876.***
  > **LA NEBBIA NON SI ALZA.** Da undici giorni una nebbia densa e bianchiccia copre {$townname} dall'alba al tramonto, e dal tramonto all'alba. Il medico condotto parla di miasmi dello stagno; il farmacista, di fumi della tenuta; Padre Anzelm, di un castigo. Le lanterne non illuminano oltre tre passi. Ieri la diligenza è arrivata con sei ore di ritardo: il cocchiere giura di aver girato in tondo tutta la notte intorno al cimitero.

  > Più strane ancora sono le testimonianze che questa redazione continua a ricevere. La signora Tóth ha visto il marito, morto da nove anni, aspettarla all'angolo della farmacia. Il fornaio ha sentito la madre chiamarlo dal forno. Tre bambini hanno giocato tutto il pomeriggio con un amico che nessuno degli adulti ha visto, e di cui nessuno conosce il nome. Si consiglia ai lettori di non uscire senza necessità, e di non rispondere a chi li chiama per nome dalla nebbia.
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G2R2:
      set _SetupImage = "Creepy_Icon"
      ! Dalla Scatola di **The Cost of Disease** prendete i **Creepy token** {icon:Creepy_Icon}: sono le **Presenze**.
      if $velo >= 6:
        ! Mettete un token {icon:Creepy_Icon} sul **Cemetery**, uno sul **Fortune Teller** e uno sullo **Hospital**.
      else:
        ! Mettete un token {icon:Creepy_Icon} sul **Cemetery** e uno sul **Fortune Teller**.
      ! Quando un giocatore fa un'azione in un Luogo con delle Presenze, guadagna 1 {icon:Creepy_Icon} per ogni token {icon:Creepy_Icon} su quel Luogo.

:: G2R2 [HUB]
  # **LA NEBBIA – Maturità**
  set round = 5
  if $hub != "G2R2":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $fede >= 0:
        ! Aprite la Village Chronicle alla sezione **The Cost of Disease** ({icon:S1_ScenarioIcon}) e andate a **pagina 8**. Rimettete le Presenze sui Luoghi con lo stesso nome.
      else:
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 6**. Rimettete le Presenze sui Luoghi con lo stesso nome; quelle senza Luogo tornano nella scatola.
  set hub = "G2R2"
  include Traguardi
  if $fede >= 0:
    block hubTitle:
      ! {icon:Storybook} **Le sedute private – Pub**
    block hubDetails:
      ! La saletta in fondo al Pub è il luogo delle sedute private. Quando un tuo pezzo visita il Pub, [[clicca qui. -> G2Pub]]
  else:
    block hubTitle:
      ! {icon:Storybook} **I posseduti – Asylum Program**
    block hubDetails:
      ! Padre Anzelm cura i "posseduti" nell'Asylum Program. Quando un tuo pezzo lo visita, [[clicca qui. -> G2Asilo]]
  block hubTitle:
    ! **Evento del secondo Round**
  block hubDetails:
    > Nella nebbia il velo è sottile come carta bagnata. Qualcuno vuole approfittarne.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G2R2" next="G2GrandeSeduta"

::round G2R2 5
fine: La Maturità della Seconda Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Vecchiaia prima di continuare.

:: G2Pub
  @@ **Questa pagina è segreta: non mostrarla agli altri.**
  set velo = $velo + 1
  # **Seduta privata**
  if $madame == "ospite":
    > Nella saletta in fondo al Pub, dietro una tenda di velluto, Madame Vámos riceve chiunque offra un bicchiere all'oste e non faccia domande.
  elif $madame == "ascesa":
    > Madame Vámos non c'è più, ma la sua sedia, nella saletta in fondo al Pub, è ancora al suo posto. Chi ci si siede davanti, con le mani sul tavolino, sente la sua voce.
  else:
    > Nella saletta in fondo al Pub una ragazza pallida, che dice di essere stata allieva della donna del carro, tiene sedute per pochi soldi.

  set caso = either("denaro", "segreto", "padre")
  if $caso == "denaro":
    > La voce della medium si fa roca, maschile: è un mugnaio morto di colera, dice, che si fidava delle banche ancora meno che dei preti. Ti descrive un mattone smosso dietro la stufa di un mulino abbandonato. Ci vai il giorno dopo, con la nebbia alle ginocchia. Il mattone c'è. Dietro c'è una scatola di latta piena di monete, e nessuno, che tu sappia, verrà mai a reclamarla.
    ! Guadagni $3.
  elif $caso == "segreto":
    > Le mani della medium stringono le tue, a lungo. Poi arriva un nome: quello di chi, in paese, ti teme più di tutti e sparge voci sul tuo conto. È un nome che conosci. Il giorno dopo vai a trovarlo con un cesto di frutta e un sorriso. Le voci, misteriosamente, si spengono.
    ! Arretra di 1 casella sul tracciato {icon:Creepy_Icon}.
  else:
    > A metà di una frase la voce della medium cambia: diventa più bassa, più lenta, con un accento che hai sentito solo nelle storie di famiglia. È il nonno. Ti chiama per nome, il tuo, e ti dice che nella nebbia il velo è sottile come carta bagnata, e che basterebbe un dito per bucarlo. Poi la candela si spegne, e la voce tace.
    ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  [[Torna al Round. => $hub]]

:: G2Asilo
  set fede = $fede - 1
  # **La cura**
  > L'Asylum Program è una vecchia caserma imbiancata a calce, con le finestre a sbarre e una croce di ferro sul cancello. Padre Anzelm, ormai curvo, lo dirige con l'aiuto di due suore e di un infermiere enorme che non parla mai. Qui la nebbia ha portato i "posseduti": gente che parla con voci non sue, che scrive in lingue mai studiate, che bussa alle pareti per ore.

  > La cura è severa: bagni gelati, preghiere, cinghie di cuoio, silenzio. Ti fa bene, in qualche modo, vedere quanto è sottile il confine tra loro e te. Ma l'uomo della cella numero sette, quando passi, smette di bussare e ti saluta con il tuo nome, e con la voce di tuo nonno.
  ! Arretra di 2 caselle sul tracciato {icon:Insanity_Icon} e guadagni 1 {icon:Creepy_Icon}.
  [[Torna al Round. => $hub]]

:: G2GrandeSeduta
  # **La Grande Seduta della Nebbia**
  include CasoGiocatore
  ! **Verbale di seduta n. 113 – {$townname}, *notte di Ognissanti, 1878.***
  if $madame == "ospite":
    > Per la notte di Ognissanti Madame Vámos convoca tutto il villaggio nel Tempio del Circolo, o in quello che ne è stato costruito. Vengono in duecento, con le lanterne, attraverso la nebbia. Al centro della sala c'è un tavolo rotondo, con una sedia per ogni erede della tenuta e due in più: una per Madame, una vuota.

    > Madame annuncia che stanotte, con l'aiuto del sangue del fondatore, proverà a evocare lui: l'uomo che per primo scrisse che i veli si sollevano. Il verbale lo redige {$caso}, per volontà della medium, "perché resti scritto da una mano di famiglia".
  else:
    > Senza una medium, la famiglia fa da sé. Nella notte di Ognissanti gli eredi si siedono intorno al vecchio tavolino del laboratorio, quello che il nonno usava per gli esperimenti di magnetismo, con il Journal aperto sull'ultima pagina e una sedia vuota a capotavola. Il verbale lo redige {$caso}.

    > Fuori la nebbia preme contro i vetri. Nessuno di loro ha mai condotto una seduta; tutti, però, hanno letto abbastanza per sapere come si fa. È questa, più di tutto il resto, la cosa che fa paura.

  > A mezzanotte la fiamma della candela, al centro del tavolo, si piega verso la sedia vuota, come per un soffio. È il momento di decidere.
  [[Clicca per continuare... => G2GrandeSedutaVoto]]

:: G2GrandeSedutaVoto
  # **Evocare il padre?**
  ui specialEvent
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: evocate il padre.
  ! NAY: interrompete la seduta.
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G2GrandeSedutaEsito" mode="Voting"

:: G2GrandeSedutaEsito
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Evocate il padre. (YAY) ~> si]]
  [[Interrompete la seduta. (NAY) ~> no]]
  fragment si:
    set velo = $velo + 2
    if $madame == "ospite" && $velo >= 8:
      set madame = "ascesa"
    goto G2Ectoplasma
  fragment no:
    set velo = $velo - 1
    goto G2SedutaInterrotta

:: G2Ectoplasma
  # **L'ectoplasma**
  if $madame == "ascesa":
    > Madame Vámos chiude gli occhi e si irrigidisce sulla sedia. Le sue labbra si schiudono, e dalla bocca comincia a uscire una sostanza bianca e luminosa, lenta, come un fumo che pesa. Si allunga sul tavolo verso la sedia vuota e prende la forma di una mano. Poi di un braccio. Qualcuno grida. La luce si fa accecante.

    > Quando torna il buio, sulla sedia di Madame c'è soltanto il suo scialle nero. Del corpo, nessuna traccia. Sul tavolo resta una pozza di sostanza bianca, ancora tiepida, che qualcuno, con mano tremante, raccoglie in una fiala.
  elif $madame == "ospite":
    > Madame Vámos rovescia la testa all'indietro. Dalla sua bocca esce una sostanza bianca e filamentosa, che si raccoglie sul tavolo in una piccola pozza luminosa. La sedia vuota scricchiola, come se qualcuno vi si fosse appena seduto. Poi Madame tossisce, si pulisce le labbra con un fazzoletto e dice, con la sua voce di sempre: "Era qui".

    > Il medico, il giorno dopo, dirà che era garza imbevuta di fosforo. Ma la sostanza che qualcuno raccoglie in una fiala, mesi dopo, brilla ancora.
  else:
    > A mezzanotte la persona più giovane seduta al tavolo comincia a parlare con una voce che non è la sua: bassa, lenta, impaziente. Pronuncia tre parole in una lingua morta, poi tossisce, e dalla sua bocca esce una sostanza bianca e filamentosa che brilla nel buio.

    > Al mattino nessuno ricorda chi abbia preso una fiala dal laboratorio per raccoglierla. Ma la fiala è piena.
  ! Chi ha l'{icon:Insanity_Icon} più alta prende la fiala (in caso di parità, il Primo Giocatore sceglie tra i pari).
  [[{$nameA} ~> A]]
  [[{$nameB} ~> B]]
  if $players > 2:
    [[{$nameC} ~> C]]
  if $players > 3:
    [[{$nameD} ~> D]]
::for L in A B C D
  fragment %L%:
    set fiala = $name%L%
    goto G2Fiala
::endfor

:: G2Fiala
  # **La fiala**
  block setupEvent next=G2Segreti:
    set _SetupImage = "S1_VialToken"
    ! **{$fiala}** prende il **Vial token** dalla Scatola di **The Cost of Disease** e lo tiene davanti a sé fino alla fine del gioco.

:: G2SedutaInterrotta
  # **Le candele si spengono**
  > Qualcuno si alza di scatto e spalanca le imposte. La candela si spegne; la sedia vuota si rovescia da sola, con un tonfo. Per un lungo momento nessuno respira.

  > Poi, fuori, la nebbia si dirada un poco, e per la prima volta da mesi si vede la luna. Qualunque cosa stesse aspettando dall'altra parte del tavolo, se n'è andata. Ma se n'è andata arrabbiata, e per tutto l'inverno, alla tenuta, le porte sbattono da sole.
  [[Clicca per continuare... => G2Segreti]]

:: G2Segreti
  if $madame != "ospite":
    goto G2R3
  # **I segreti di Madame**
  > Qualche settimana dopo la seduta, Madame Vámos manda a ogni erede un biglietto listato a lutto. Non ha più molto tempo, scrive; o forse ne ha troppo. In ogni caso è venuto il momento di lasciare a qualcuno il suo segreto più prezioso: il modo di non morire del tutto.

  > Lo venderà a una persona soltanto: a chi saprà dimostrare di tenerci di più. "I miei figli spirituali", aggiunge in fondo al biglietto, "capiranno che anche l'eternità ha un prezzo."
  ui specialEvent
  ! Ogni giocatore prende in mano in segreto il denaro che vuole offrire. Quando tutti sono pronti, rivelate insieme le offerte. Chi offre di più paga e prende una **Immortality card**; gli altri riprendono il loro denaro.
  [[Clicca per iniziare l'offerta... ~> 0]]
  fragment 0:
    ui bidding next="G2SegretiEsito" mode="Bidding"

:: G2SegretiEsito
  # **Il segreto della vita eterna**
  block setupEvent next=G2R3:
    set _SetupImage = "S1_Immortality"
    ! Chi ha offerto di più pesca a caso una **Immortality card** dalla Scatola di **The Cost of Disease**. Il testo stampato vale così come è scritto.

:: G2R3 [HUB]
  # **LA NEBBIA – Vecchiaia**
  set round = 6
  if $hub != "G2R3":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $fede >= 0:
        ! Aprite la Village Chronicle alla sezione **The Cost of Disease** ({icon:S1_ScenarioIcon}) e andate a **pagina 9**. Rimettete le Presenze sui Luoghi con lo stesso nome.
      else:
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 7**. Rimettete le Presenze sui Luoghi con lo stesso nome.
  set hub = "G2R3"
  include Traguardi
  if $fede >= 0:
    block hubTitle:
      ! {icon:Storybook} **Le sedute private – Pub e Seedy Pub**
    block hubDetails:
      ! Quando un tuo pezzo visita il Pub o un Seedy Pub, [[clicca qui. -> G2Pub]]
  else:
    block hubTitle:
      ! {icon:Storybook} **I posseduti – Asylum Program**
    block hubDetails:
      ! Quando un tuo pezzo visita l'Asylum Program, [[clicca qui. -> G2Asilo]]
  block hubTitle:
    ! {icon:Storybook} **Il Telegrafo – Perform Experiment**
  block hubDetails:
    ! Quando completi un Esperimento **Engineering**, puoi rinunciare ai suoi VP per lavorare al Telegrafo: [[clicca qui. -> G2Contributo]]
  block hubTitle:
    ! **Fine della Generazione**
  block hubDetails:
    > Il Sindaco Bódi, figlio di quello che sedeva al consiglio nel 1856, è malato, e cerca un erede politico.
  [[Clicca qui alla Fine della Generazione per continuare... ~> 0]]
  fragment 0:
    ui endOfRound progress="G2R3" next="G2Fine"

::round G2R3 0
fine: La Vecchiaia della Seconda Generazione è finita.
poi: Eseguite le azioni di Fine Round, poi continuate con lo Storybook prima della Fine della Generazione.

:: G2Contributo
  set contributi = $contributi + 1
  # **Un filo di rame**
  if $contributi >= $players && $apparato < 2:
    set apparato = $apparato + 1
    set contributi = 0
    if $apparato == 2:
      > Con l'ultimo filo saldato, il secondo stadio del Telegrafo prende vita. I vasi di vetro si illuminano di una luce lattiginosa, la tastiera d'osso vibra, e l'ago non trema più: si sposta deciso da un tasto all'altro e, per la prima volta, compone una parola intera.

      > È un nome. Nessuno in famiglia lo conosce; ma la mattina dopo, al cimitero, lo trovano inciso su una lapide che il becchino giura di non aver mai visto.
    else:
      > Pezzo dopo pezzo, senza aspettare il consenso di nessuno, il primo stadio del Telegrafo è finalmente montato contro la parete del laboratorio. Quando lo accendi, le lampade di tutta la casa si abbassano, e l'ago, nell'ampolla, comincia a tremare. Cerca una lettera. Non la trova ancora.
  else:
    > Saldi un altro tratto di filo, tari l'ago, sostituisci un vaso incrinato. La macchina cresce, ma l'ago resta immobile: mancano ancora dei pezzi. Mentre metti via gli attrezzi, ti sembra di sentire un colpo, impaziente, dall'interno dell'ampolla.
  ! Non guadagni i VP dell'Esperimento: guadagni invece 1 Conoscenza Ingegneristica (Engineering Knowledge).
  [[Torna al Round. => $hub]]

:: G2Fine
  # **L'erede del Sindaco**
  ! **Gazzetta di {$townname} – *1881.***
  > **IL SINDACO E LE SUE AMICIZIE.** Il Sindaco Bódi, che ha ereditato la carica dal padre come altri ereditano un orologio, è malato da tempo e non lo nasconde. Non nasconde nemmeno di cercare, tra le famiglie notabili di {$townname}, qualcuno da proteggere negli anni a venire, e da cui farsi proteggere a sua volta.

  > Corre voce che le famiglie della tenuta abbiano già fatto le loro offerte, in denaro e in favori. Questo giornale non è in grado di confermarlo, e il suo direttore è stato pregato di non insistere.
  ui specialEvent
  ! Ogni giocatore prende in mano in segreto il denaro che vuole offrire. Quando tutti sono pronti, rivelate insieme le offerte. Chi offre di più paga e prende la **Mayor Coin**; gli altri riprendono il loro denaro.
  [[Clicca per iniziare l'offerta... ~> 0]]
  fragment 0:
    ui bidding next="G2Sindaco" mode="Bidding"

:: G2Sindaco
  # **Il favore del Sindaco**
  ! Chi ha vinto l'offerta?
  [[{$nameA} ~> A]]
  [[{$nameB} ~> B]]
  if $players > 2:
    [[{$nameC} ~> C]]
  if $players > 3:
    [[{$nameD} ~> D]]
::for L in A B C D
  fragment %L%:
    set sindaco = $name%L%
    goto G2SindacoMoneta
::endfor

:: G2SindacoMoneta
  # **La moneta**
  block setupEvent next=G2Domande:
    set _SetupImage = "S1_MayorCoin"
    ! **{$sindaco}** prende la **Mayor Coin** dalla Scatola di **The Cost of Disease**. Nella Terza Generazione, chi ha la Mayor Coin non paga il $1 in più quando visita un Luogo già occupato.

:: G2Domande
  # **Prima del buio**
  > Gli anni della vecchiaia passano in fretta, come passano sempre per chi ha troppo da fare. La nebbia sale e scende con le stagioni, ma non se ne va mai del tutto: si ritira nei fossi, nel cimitero, dietro le serre della tenuta, e aspetta.
  ! Prima di azzerare i tracciati, lo Storybook ha bisogno di sapere come lascia questo mondo ognuno dei vostri scienziati.
  [[Clicca per continuare... => G2DomA]]

::for L in A B C D | Chiusura
:: G2Dom%L%
  if %L.n% > $players:
    goto G2DomChiusura
  # **L'ultima pagina di {$name%L%}**
  prompt ins2%L% number: {$name%L%}, a che casella è il tuo segnalino {icon:Insanity_Icon}?
  prompt cuo2%L% number: {$name%L%}, quanti Charity token {icon:S1_HeartToken} hai?
  set conforto = $conforto + $cuo2%L%
  goto G2Dom%L.next%
::endfor

:: G2DomChiusura
  # **Fine della Generazione**
  ! **Nota del dott. Halász.**
  > Anche le carte della seconda generazione si chiudono con una serie di funerali. Ho voluto controllare le lapidi di persona, una per una, con la lanterna, perché nella nebbia del cimitero (sì, c'è ancora) non si leggeva nulla. Le date sono quelle dei registri. Ma sotto ogni data, in un carattere più piccolo, il lapicida ha inciso anche l'ora; e tutte quelle ore cadono tra la mezzanotte e le tre.

  > Il lapicida, interrogato da un mio collega nel 1902, dichiarò di non aver mai inciso alcuna ora.
  ui endOfGeneration generation=6 text: Rimuovete tutti i pezzi dal tabellone ed eseguite la Fine della Generazione. Rimettete nella riserva i token {icon:StorybookToken} non usati e i Charity token {icon:S1_HeartToken} dei giocatori. Le Presenze {icon:Creepy_Icon} tornano nella scatola.
  [[Clicca per continuare... => G3Intro]]
