class HistoryCard {
  String name;
  String status;
  List stages;
  double price;
  String image;

  HistoryCard({
    this.name,
    this.status,
    this.stages,
    this.price,
    this.image,
  });

  static List<HistoryCard> historyList = [
    HistoryCard(
        name: 'Abdul Basit',
        status: 'Active',
        stages: [true, false, false, false],
        price: null,
        image: 'im1.jpg'),
    HistoryCard(
        name: 'Abdullah Kazmi',
        status: 'Active',
        stages: [true, true, false, false],
        price: null,
        image: 'im2.jpg'),
    HistoryCard(
        name: 'Zaid Bin Arif',
        status: 'Completed',
        stages: [true, true, true, true],
        price: 1184,
        image: 'im3.jpg'),
    HistoryCard(
        name: 'Abdul Basit',
        status: 'Completed',
        stages: [true, true, true, true],
        price: 425,
        image: 'im1.jpg'),
    HistoryCard(
        name: 'Abdullah Kazmi',
        status: 'Cancelled',
        stages: [true, false, false, false],
        price: 827,
        image: 'im2.jpg'),
    HistoryCard(
        name: 'Zaid Bin Arif',
        status: 'Completed',
        stages: [true, true, true, true],
        price: 1184,
        image: 'im3.jpg'),
    HistoryCard(
        name: 'Abdul Basit',
        status: 'Cancelled',
        stages: [true, true, false, false],
        price: 425,
        image: 'im1.jpg'),
    HistoryCard(
        name: 'Abdullah Kazmi',
        status: 'Completed',
        price: 827,
        stages: [true, true, true, true],
        image: 'im2.jpg'),
    HistoryCard(
        name: 'Zaid Bin Arif',
        status: 'Completed',
        stages: [true, true, true, true],
        price: 1184,
        image: 'im3.jpg')
  ];
}
