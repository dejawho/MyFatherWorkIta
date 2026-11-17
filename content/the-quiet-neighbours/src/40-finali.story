// I finali. Ognuno è l'ultima pagina del Registro di Wil Maas, poi l'epilogo comune.
// Testo italiano completo, rivisto per coerenza.

:: Epilogo
  ! **Che ne fu degli altri.**
  > Trijntje Kalf suonò l'organo della chiesa di {$townname} fino a ottantacinque anni, ogni domenica, e ogni domenica stonò una nota, una sola, forte, a metà dell'inno. Quando morì, al funerale, l'organista nuova suonò tutto alla perfezione. In fondo alla chiesa, qualcuno si alzò e se ne andò.

  > La maestra Neeltje Borg sognò fino all'ultima notte della sua vita. L'ultimo sogno lo scrisse sul quaderno, la mattina, con la mano tremante: *la torbiera era asciutta, e c'erano i bambini che giocavano*. Poi si rimise a letto, e non si svegliò più. Aveva le mani calde.
  if $fokke == "svegliato":
    > Gerrit Tammer morì nel 1922, nella casa sull'argine, con il figlio Hendrik accanto. Sul comodino teneva due fotografie: suo padre giovane, con la vanga in spalla, e suo padre vecchio, dietro il banco della torba nera. Non disse mai quale dei due aveva voluto più bene.
  elif $finale == "risveglio":
    > Gerrit Tammer morì nel 1922, nella casa sull'argine, con il figlio Hendrik accanto. Fece in tempo ad avere suo padre per due anni: un torbaio di quarant'anni, ubriacone e bestemmiatore, che lo chiamava "vecchio" e gli rubava il tabacco. Gli bastò.
  elif $finale == "fuoco":
    > Gerrit Tammer morì nel 1922, nella casa sull'argine, con il figlio Hendrik accanto. Dopo il fuoco non tornò più al Park. Diceva che suo padre, almeno, era morto dormendo.
  else:
    > Gerrit Tammer morì nel 1922, nella casa sull'argine, con il figlio Hendrik accanto. Ogni domenica, fino all'ultima, portò i fiori allo scavo del Park, dove suo padre dorme ancora, sotto due metri di torba, con le mani giunte e le ustioni che non guariscono.
  if $scudo != "":
    > La lanterna della Ronda, quella che il pastore Kalf accese per primo e {$scudo} portò per anni, è appesa nella torre, accanto all'anello d'ottone. Qualcuno, ogni sera, la accende.
  if $vanga != "":
    > La vanga dei Tammer, quella che {$vanga} prese dalle mani di Gerrit al cimitero, è appesa accanto alla lanterna, con il manico consumato da tre generazioni di mani calde.
  if $consiglio == "accettato":
    > La medaglia d'argento del consiglio è ancora nell'ingresso della tenuta. Non si è mai ossidata.
  if $piet == "torbiera" && $finale != "spezzata" && $finale != "fuoco":
    > Piet Brink, il direttore del Conservative Report, una sera d'inverno uscì dal giornale senza cappotto e prese la strada dell'argine. Lo videro entrare nella torbiera nel punto dove era caduto da ragazzo, chiamando sua madre. Non uscì più. La mattina dopo, sulla riva, c'era un ragazzo di quindici anni, bagnato, scalzo, che chiedeva della vedova Brink.
  if $cane == "preso":
    > I discendenti di Bruin, il cane di Fokke Tammer, vivono ancora alla tenuta: neri, grossi, pazienti. Abbaiano soltanto a certe persone. Nessuno li ha mai addestrati a farlo.
  if $corrente:
    > La lampadina sopra l'anello d'ottone, quella della compagnia della luce, non si è mai fulminata. Il contatore della torre, da allora, gira al contrario.
  if $finale != "cerchio":
    > Wil Maas visse fino a novant'anni e non si sposò mai. Fino all'ultimo, ogni sera, prima di dormire, tirava fuori dal taschino l'orologio della nonna, fermo sulle undici e un quarto, e si chiedeva da dove fosse venuta la pietra, se nessuno l'aveva rimandata indietro. Poi lo rimetteva via, si misurava la temperatura, e la annotava. Trentasei e otto, sempre.
  else:
    > Wil Maas visse fino a novant'anni e non si sposò mai. Fino all'ultimo, ogni sera, prima di dormire, si misurava la temperatura e la annotava. Trentasei e otto, sempre. L'orologio della nonna lo lasciò alla famiglia della tenuta, con un biglietto: *Era vostro. Lo è sempre stato.*
  if $evSiebe:
    > Il quaderno del becchino Siebe, quello con le facce viste nell'acqua, finì nella torre insieme al Registro, oppure nella stufa della sua casetta. In un caso o nell'altro, nessuno lo lesse più. I nomi, però, sono ancora là sotto.
  if $nozze == "canzone":
    > Marieke, la ragazza che disse di no all'altare, partì per la città nel 1920 e diventò cantante d'operetta. Stonava, dicono i critici, in un modo commovente.
    if $finale == "spezzata":
      > Jan Hoek, il suo fidanzato tornato dalle Fiandre, non le scrisse mai: la notte della pietra, nella sua stanza, restò soltanto un mucchio di torba e una penna.
    else:
      > Jan Hoek, il suo fidanzato tornato dalle Fiandre, le scrisse ogni settimana, per cinquant'anni, la stessa lettera.
  elif $nozze == "sposati" && $finale != "spezzata" && $finale != "fuoco":
    > Jan e Marieke Hoek ebbero tre figli, sani, sereni, bravissimi a scuola. Nessuno dei tre, da bambino, ha mai avuto un incubo.
  if $mugnaio == "partito":
    > Harm Visser, il mugnaio, morì a Rotterdam nel 1901, povero, ubriaco e libero. Ogni Natale mandava una cartolina alla tenuta, sempre la stessa: *Grazie per il biglietto. Qui si litiga benissimo.*
  if $lambert:
    > Le catene di ferro che il capomastro Lambert mise intorno alla torre ci sono ancora. Arrugginiscono soltanto dalla parte della torbiera.
  if $kees:
    > Il ragazzo dei Van Dam, quello che sbagliava tutto, diventò il meccanico più disordinato della provincia, e il più amato. Quando qualcuno gli chiedeva come facesse a sbagliare così tanto, rispondeva che sbagliare era l'unico modo che conosceva di essere sicuro di essere sé stesso.

:: FinaleFuoco [ending]
  # **Il Fuoco nella Torba**
  ui generationEndingContinue enabled=true
  ! **Registro Maas – Wil Maas, *1920.***
  > Non abbiamo votato. Mentre eravamo nella torre, giù in paese la Ronda aveva già deciso per tutti. Hendrik Tammer e una ventina di uomini, quelli che non avevano mai bevuto, sono andati all'argine con le taniche di petrolio della compagnia della luce e hanno dato fuoco alla torbiera in dieci punti diversi, tutti insieme, alle tre del mattino.

  > La torba brucia in un modo che non si dimentica. Non fa fiamme alte: fuma, cova, si mangia la terra dal di sotto, per metri, senza che in superficie si veda niente se non un velo grigio e un odore dolciastro. Non si può spegnere. Non si può fermare. I pompieri della città sono venuti, hanno guardato, e sono ripartiti.

  > La torbiera di {$townname} ha bruciato sotto terra per sette anni. Con tutto quello che c'era dentro.

  > I Vicini non sono scappati. Sono andati all'argine, la prima mattina, tutti insieme, in silenzio, e si sono seduti sulla riva a guardare il fumo, come si veglia un parente. Molti sono rimasti lì finché non hanno cominciato a seccarsi e a crepare, a uno a uno, come Fokke. Gli altri sono tornati in paese, gentili come prima. Non hanno mai detto una parola a chi aveva acceso il fuoco. Gli hanno soltanto, per sette anni, dato il buongiorno.

  > Io misuro ancora le temperature. Ma quando, la notte, il vento porta in paese l'odore della torba che brucia, non riesco a dormire. Penso a quelli che dormivano laggiù, e che non hanno fatto in tempo a svegliarsi.
  if $copia != "" && !$smascherata:
    > La notte del fuoco {$copiaNome} non scese in paese. Passò la notte nella torre, alla finestra, a guardare il fumo, fino all'alba, con le mani fredde appoggiate al vetro. La mattina dopo fece colazione con noi, come sempre, e chiese di passare il sale. Non abbiamo mai più parlato di quella notte.
  if $fokke == "svegliato":
    > Il vecchio Fokke, quello svegliato dalla torba, era morto già da tre anni. Hendrik dice che ne sarebbe stato contento. Non l'ha mai detto davanti a suo padre.
  include Epilogo
  ! FINE?

:: FinaleQuieto [ending]
  # **Il Paese Quieto**
  ui generationEndingContinue enabled=true
  ! **Registro Maas – Wil Maas, *1920.***
  > Non c'è stato bisogno di votare. Quando siamo scesi dalla torre, all'alba, il paese era sveglio, e ci aspettava sotto le finestre della tenuta: tutto il paese, in silenzio, con le mani in tasca. Non volevano niente. Volevano soltanto che lo sapessimo.

  > Ho rifatto i conti del Registro. A {$townname} siamo rimasti in pochi: la famiglia della tenuta, Trijntje Kalf, la maestra Borg, Hendrik Tammer, io, e una manciata di vecchi testardi che bevono solo gin. Gli altri, tutti gli altri, sono loro. Il sindaco, i consiglieri, i maestri, i bambini delle scuole, i reduci del monumento. Il paese è loro, e lo è da più tempo di quanto vogliamo ammettere. Noi siamo gli ultimi.

  > Non ci fanno del male. Non ce ne hanno mai fatto. Ci portano la frutta, ci riparano le tegole, ci salutano per nome, e aspettano. Hanno tempo: ne hanno sempre avuto più di noi. Uno alla volta, un po' per stanchezza, un po' per solitudine, un po' perché il sonno, alla fine, è dolce, berremo anche noi.

  > Stamattina, al risveglio, mi sono misurata la temperatura, come ogni giorno. Trentacinque e nove. Ho rimesso il termometro nell'astuccio e ho scritto il numero qui, senza commenti. Mio padre misurava. Mia nonna contava. Io, da oggi, aspetto.
  if $copia != "":
    > Alla tenuta, {$copiaNome} ci tratta con una dolcezza infinita. Porta la colazione a letto, ripara le persiane, ci legge la sera, quando non riusciamo a dormire. Non ci ha mai chiesto di bere. Sa che non ce n'è bisogno: basta aspettare.
  if $consiglio == "accettato":
    > La medaglia del consiglio, nell'ingresso, brilla più che mai. Il sindaco viene a lucidarla di persona, una volta al mese, e ogni volta resta a cena.
  include Epilogo
  ! FINE?

:: FinaleReduce [ending]
  # **Il Reduce**
  ui generationEndingContinue enabled=true
  ! **Registro Maas – Wil Maas, *1 gennaio 1920.***
  > Siamo rimasti alla finestra della torre fino all'alba, a guardare la torbiera. La neve, nel punto della luce, continuava a non posarsi. Verso le sette l'acqua si è mossa. Dall'acqua è venuta fuori, piano, con l'acqua alle ginocchia, una persona che conoscevamo: {$copiaNome}, la persona vera, quella che dormiva sotto la torba dalla notte della festa. La pelle bianca, le labbra viola, i denti che battevano.

  > Abbiamo portato {$copiaNome} a casa, nelle coperte, vicino al fuoco. Ho misurato la temperatura ogni ora: trentaquattro. Poi trentacinque. Poi, a mezzogiorno, trentasei e otto. Allora sono venute le lacrime, senza un perché.

  > Delle ultime settimane non resta niente: la festa, i giorni in casa, le sere con la famiglia, il test. Resta soltanto un sogno lunghissimo, in cui qualcuno con la stessa faccia faceva tutto meglio. Non dispiaceva, dice. Laggiù c'era soltanto una grande stanchezza.

  > Il paese, il giorno dopo, è venuto alla tenuta in silenzio, con i fiori. Non per chi era tornato: per l'altro. Hanno lasciato i fiori sull'argine, nel punto della luce, e sono tornati a casa.

  > L'altro, laggiù, adesso dorme. Ha preso il posto di chi ha restituito. Il conto, almeno questo, torna.
  if $pietra == "famiglia":
    > La pietra è rimasta alla tenuta, nella sua cassetta di feltro, calda. Nessuno ha avuto il coraggio di decidere che cosa farne, dopo. Ogni tanto, la notte, chi è tornato dalla torbiera scende in laboratorio e ci appoggia sopra una mano, a lungo. Dice che così ricorda il sogno.
  else:
    > La pietra è rimasta nella torbiera, nel punto della luce. Chi è tornato ci va ogni domenica, all'alba, e resta sull'argine a guardare l'acqua. Dice che non ha nostalgia. Dice che vuole soltanto ricordarsi com'era stare in pace.
  include Epilogo
  ! FINE?

:: FinaleSpezzata [ending]
  # **La Pietra Spezzata**
  ui generationEndingContinue enabled=true
  ! **Registro Maas – Wil Maas, *1 gennaio 1920.***
  > Il martello di Jaap Mol è passato di mano in mano, e alla fine qualcuno l'ha alzato. Un colpo solo, preciso, come quelli di Jaap. La pietra non si è spaccata: si è aperta, come un frutto, e dentro era vuota. Un odore di torbiera ha riempito la stanza, poi niente. Era fredda, per la prima volta.

  > All'alba sono scesa in paese con la borsa. Non è servita. In ogni casa, nei letti, sulle sedie, dietro i banchi dei negozi, c'erano mucchi di torba nera e bagnata, con dentro vestiti, occhiali, dentiere, fedi. Il sindaco Bram Wessel, al Town Hall, seduto alla sua scrivania. Il cassiere della banca. La bibliotecaria. I tre ragazzi del monumento. Tutti quelli che avevano bevuto, tutti quelli che erano tornati dalla torbiera un po' diversi, quelli di cinquant'anni e quelli di ieri.
  if $copia != "":
    > E alla tenuta, nella camera di {$copiaNome}, sul cuscino, un mucchio di torba con la forma di una testa addormentata.
  > {$townname} è un paese di vecchi, di bambini piccoli e di case vuote. Ho contato i vivi: centoventi. Erano novecento. Il consiglio non esiste più, la scuola è chiusa, la banca pure. Al mercato, di nuovo, si litiga sul prezzo delle aringhe. All'osteria si canta stonato. Ieri sera c'è stata una rissa. Ho medicato due nasi rotti e ho riso tutto il tempo.

  > Sotto la torba, nella torbiera, i dormienti dormono ancora. Senza la pietra, non sappiamo se si sveglieranno mai. Gerrit Tammer, che ha passato i sessanta, ci va ogni mattina, con la vanga, e scava. Dice che uno, prima o poi, aprirà gli occhi.
  if $fokke == "svegliato":
    > Gerrit, almeno, il suo l'ha già svegliato una volta. Dice che sa come si fa.
  if $riparata:
    > La Macchina, nella torre, ronza ancora, piano, ogni notte alle undici e un quarto. Non abbiamo il coraggio di spegnerla. Non sappiamo che cosa stia aspettando.
  include Epilogo
  ! FINE?

:: FinaleRisveglio [ending]
  # **Il Risveglio**
  ui generationEndingContinue enabled=true
  ! **Registro Maas – Wil Maas, *gennaio 1920.***
  > Abbiamo scavato per un mese, con la vanga di Gerrit e altre duecento vanghe. All'inizio eravamo in pochi: noi della tenuta, la Ronda, Hendrik. Poi sono venuti anche loro, i Vicini, senza che nessuno li chiamasse, con le vanghe in spalla e le maniche arrotolate. Hanno scavato accanto a noi, in silenzio, senza mai stancarsi. Sapevano dove.

  > Li abbiamo tirati fuori a centinaia: bianchi, freddi, addormentati, con i vestiti di cinquant'anni fa, di trent'anni fa, della settimana scorsa. La moglie del mugnaio. La signora Wessel, la madre del sindaco. La signora Mulder, che il marito credeva a Rotterdam con sé. Si sono svegliati tutti, piano, nel giro di qualche giorno, nella palestra della scuola trasformata in ospedale, sotto le coperte, con me e Trijntje Kalf a misurare le temperature.

  if $fokke != "svegliato":
    > Per primo, Fokke Tammer, giovane come nel 1865, con le ustioni sui palmi. Gerrit lo ha vegliato tre giorni.
  > Ora {$townname} ha due di tutti. Due Jan Hoek, due Piet Brink, due mogli del mugnaio, che non si guardano e non si parlano. I risvegliati sono stanchi, confusi, arrabbiati, spaventati; non sanno che anno è, non riconoscono le strade, piangono per i figli cresciuti senza di loro. I Vicini li aiutano in tutto, con una pazienza infinita, come si aiuta un parente malato. Non si capisce più chi sia la famiglia di chi.

  > Nessuno sa che cosa succederà. Io so soltanto che ieri sera, all'osteria, un uomo appena svegliato ha tirato un pugno al suo doppio, e il doppio, invece di difendersi, lo ha abbracciato. Sono rimasti così, abbracciati, a lungo, uno caldo e uno freddo. Poi hanno ordinato due gin.
  if $copia != "":
    > Anche alla tenuta, adesso, ci sono due {$copiaNome}. Una delle due persone è venuta fuori dalla torba con la memoria ferma alla notte della festa; l'altra le ha ceduto la stanza, i vestiti, la sedia a tavola, e dorme sul divano. Litigano su tutto. Si somigliano sempre meno. Stamattina, per la prima volta, chi dorme sul divano ha stonato una nota, cantando, e ha riso.
  if $pietra == "famiglia":
    > La pietra è ancora alla tenuta, calda, nella sua cassetta. I risvegliati non vogliono avvicinarsi al laboratorio. I Vicini ci passano davanti, ogni tanto, e si fermano un momento, come si fa davanti a una chiesa.
  include Epilogo
  ! FINE?

:: FinaleCerchio [ending]
  # **Il Cerchio**
  ui generationEndingContinue enabled=true
  ! **Registro Maas – Wil Maas, *1 gennaio 1920.***
  > {$macchinaNome} ha messo la pietra sulla piattaforma, al centro dell'anello. Era calda, e pulsava, piano. Il bisnonno lo aveva scritto: *deve tornare da dove viene*. Lo abbiamo fatto. Alle undici e un quarto la Macchina si è accesa: luce bianca, nessun calore, un ronzio di api dentro un muro. La pietra è sparita.

  > Ho tirato fuori il Registro e l'ho aperto alla prima pagina, quella della nonna Hester. *11 novembre 1865. Notte, ore undici e un quarto. Vista una luce bianca sulla torre della tenuta, forte come il giorno. Nello stesso istante, un'altra luce uguale in mezzo alla torbiera.* Ho guardato dalla finestra, verso la torbiera. Non si vedeva niente. Non doveva: quella luce si è accesa cinquantaquattro anni fa.

  > Il bisnonno pensava che qualcosa fosse passato dall'altra parte, e che dovesse tornare da dove veniva. Si sbagliava solo sul verso. La pietra non veniva da un altro mondo, e non l'ha presa lui. L'abbiamo mandata noi. Stanotte, volendo liberare il paese dalla pietra, l'abbiamo mandata là dove tutto è cominciato. {$townname} è diventata quello che è perché noi, cinquantaquattro anni dopo, l'avremmo rimandata indietro. La pietra esiste nel passato perché esisteva nel futuro, e nel futuro perché esisteva nel passato. Non viene da nessuna parte. Gira in cerchio. E noi siamo il punto in cui il cerchio si chiude.

  > Non nasceranno più Vicini. Quelli che ci sono resteranno, finché la torba regge: dieci anni, venti, cinquanta. Si sbricioleranno uno alla volta, piano, come Fokke. Il paese avrà il tempo di salutarli. Stamattina, al mercato, uno di loro mi ha chiesto come stavo, e per la prima volta, nella sua voce, c'era qualcosa che somigliava alla paura.

  > Sul tavolo della torre ho lasciato l'orologio della nonna, fermo sulle undici e un quarto. Adesso so che ora segna.
  if $copia != "" && !$smascherata:
    > {$copiaNome} era nella stanza, quando la pietra è sparita. Ha guardato la piattaforma vuota a lungo, con le mani fredde lungo i fianchi. Poi ci ha guardati, uno per uno, e ha detto soltanto: "Grazie. Adesso so quanto tempo ho." Non c'era rancore nella sua voce. C'era, per la prima volta, qualcosa di simile alla fretta.
  if $segreto == "detto":
    > Il Morning Liberal, che a novembre aveva pubblicato la nostra dichiarazione, ha pubblicato anche questa. Sotto, piccolo, un commento del direttore: *Se è vero, è la storia più triste che io abbia mai stampato. Se non è vero, anche.*
  include Epilogo
  ! FINE?

:: FinaleSemina [ending]
  # **La Nuova Semina**
  ui generationEndingContinue enabled=true
  ! **Registro Maas – Wil Maas, *1 gennaio 1920.***
  > Abbiamo portato la pietra all'argine all'alba, sotto la neve, avvolta nel suo sacco. Ci aspettava tutto il paese. Nessuno ha detto una parola. Quando l'abbiamo consegnata, l'hanno passata di mano in mano, con una cura infinita, fino alla riva, e il sindaco Bram Wessel è entrato nell'acqua fino al petto per posarla nel punto della luce. La pietra è affondata senza un rumore. La neve, finalmente, ha cominciato a posarsi.

  > Da quel giorno i Vicini non si sbriciolano più. I più vecchi, quelli che avevano cominciato a seccarsi, si sono ripresi in una settimana: le crepe si sono chiuse, la pelle è tornata liscia. Ci hanno ringraziati, uno per uno, venendo alla tenuta con i fiori. Ci hanno detto che non lo dimenticheranno. Ci credo: non dimenticano mai niente.

  > E la torbiera ricomincia. La fontana della piazza dà di nuovo acqua scura, fresca, buona. I bambini nati quest'anno la bevono dal biberon. Il consiglio ha già un progetto per un acquedotto, che porti l'Acqua di {$townname} in tutta la provincia, e poi in tutto il regno, e poi chissà.

  > Ho deciso di restare. Qualcuno deve contare. Ma ieri sera, per la prima volta in vita mia, ho bevuto un bicchiere della fontana. Volevo sapere che sapore avesse la pace. È buona. Domattina mi misurerò la temperatura, e la scriverò qui, come sempre. Se non la scriverò, sapete perché.
  if $copia != "":
    > {$copiaNome} mi ha accompagnata alla fontana, ieri sera. Mi ha tenuto il bicchiere, gentile, come si fa con un bambino che prende la medicina. Ha detto che non me ne pentirò. Ha detto che nessuno, a {$townname}, si è mai pentito di niente.
  if $riparata:
    > La Macchina, nella torre, è rimasta accesa per tre giorni dopo la notte del voto, ronzando, con la piattaforma vuota. Poi si è spenta da sola. Da allora nessuno ha più provato ad accenderla.
  include Epilogo
  ! FINE?

:: FinaleRegistro [ending]
  # **Il Registro Chiuso**
  ui generationEndingContinue enabled=true
  ! **Registro Maas – Wil Maas, *1 gennaio 1920.***
  > Abbiamo votato di non fare niente. È una scelta anche questa, la più comune di tutte. La pietra resta nella torbiera, i dormienti dormono, i Vicini ci salutano per strada. Il paese è tranquillo. Domani sarà tranquillo come oggi, e dopodomani di più.

  > Chiudo il Registro qui. Tre generazioni di temperature, di mani fredde, di nomi con una crocetta accanto. Mia nonna li contava, mio padre li misurava, io li ho sommati. Il totale non serve a niente, se nessuno lo legge. Lo lascio alla famiglia della tenuta, perché lo tenga nella torre, accanto alla Macchina che non è servita a niente e all'orologio che non segna più l'ora.

  > Ogni tanto, la sera, vado sull'argine a guardare la torbiera. La neve, nel punto della luce, non si posa mai. Sotto, a centinaia, quelli che dormono continuano a dormire, con le mani giunte, conservati come il giorno in cui sono stati presi. Sopra, quelli che camminano continuano a camminare, gentili, sani, in pace. Fra cinquant'anni si sbricioleranno, e altri prenderanno il loro posto, e nessuno, a {$townname}, se ne accorgerà.

  > Non so se abbiamo sbagliato. Ma per la prima volta in vita mia, chiudendo questo quaderno, mi sento quieta anch'io. E questo, più di tutto il resto, mi spaventa.
  if $copia != "" && !$smascherata:
    > {$copiaNome}, dopo il voto, mi ha accompagnata a casa, sotto la neve, tenendomi l'ombrello. Sulla porta mi ha ringraziata. Per che cosa? "Per aver lasciato le cose come sono", è stata la risposta. "È la cosa più gentile che si possa fare."
  if $consiglio == "rifiutato":
    > La famiglia della tenuta, almeno, non ha mai accettato la medaglia. È poco. Ma a {$townname}, ormai, il poco è tutto quello che resta di nostro.
  include Epilogo
  ! FINE?
