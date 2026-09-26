import '../../domain/entities/google_office.dart';

class LocalOfficeDataSource {
  List<GoogleOffice> getOffices() => const [
        GoogleOffice(
          id: 'googleplex',
          name: 'Googleplex',
          city: 'Mountain View',
          country: 'Amerika Serikat',
          region: OfficeRegion.americas,
          address: '1600 Amphitheatre Parkway, Mountain View, CA',
          imageUrl:
              'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=900&auto=format&fit=crop&q=80',
          description:
              'Kampus utama Google yang menjadi rumah bagi berbagai tim dan ruang kerja di Silicon Valley.',
          phoneNumber: null,
          latitude: 37.4220,
          longitude: -122.0841,
        ),
        GoogleOffice(
          id: 'google-new-york',
          name: 'Google New York',
          city: 'New York',
          country: 'Amerika Serikat',
          region: OfficeRegion.americas,
          address: '111 8th Avenue, New York, NY',
          imageUrl:
              'https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?w=900&auto=format&fit=crop&q=80',
          description:
              'Kantor Google di Chelsea, dekat dengan komunitas teknologi dan kreatif New York.',
          phoneNumber: null,
          latitude: 40.7411,
          longitude: -74.0048,
        ),
        GoogleOffice(
          id: 'google-london',
          name: 'Google London',
          city: 'London',
          country: 'Britania Raya',
          region: OfficeRegion.europe,
          address: '6 Pancras Square, London',
          imageUrl:
              'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=900&auto=format&fit=crop&q=80',
          description:
              'Kantor di kawasan King\'s Cross yang menjadi salah satu pusat aktivitas Google di Eropa.',
          phoneNumber: null,
          latitude: 51.5332,
          longitude: -0.1260,
        ),
        GoogleOffice(
          id: 'google-dublin',
          name: 'Google Dublin',
          city: 'Dublin',
          country: 'Irlandia',
          region: OfficeRegion.europe,
          address: 'Gordon House, Barrow Street, Dublin 4',
          imageUrl:
              'https://images.unsplash.com/photo-1549918864-48ac978761a4?w=900&auto=format&fit=crop&q=80',
          description:
              'Kampus Google di Dublin yang mendukung berbagai tim untuk kawasan Eropa, Timur Tengah, dan Afrika.',
          phoneNumber: null,
          latitude: 53.3390,
          longitude: -6.2365,
        ),
        GoogleOffice(
          id: 'google-singapore',
          name: 'Google Singapore',
          city: 'Singapura',
          country: 'Singapura',
          region: OfficeRegion.asiaPacific,
          address: 'Mapletree Business City, 70 Pasir Panjang Road',
          imageUrl:
              'https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=900&auto=format&fit=crop&q=80',
          description:
              'Kantor regional di Singapura yang menghubungkan tim Google di kawasan Asia Pasifik.',
          phoneNumber: null,
          latitude: 1.2750,
          longitude: 103.7998,
        ),
        GoogleOffice(
          id: 'google-sydney',
          name: 'Google Sydney',
          city: 'Sydney',
          country: 'Australia',
          region: OfficeRegion.asiaPacific,
          address: '5 Martin Place, Sydney NSW',
          imageUrl:
              'https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?w=900&auto=format&fit=crop&q=80',
          description:
              'Kantor Google di pusat kota Sydney yang melayani pengguna dan mitra di Australia.',
          phoneNumber: null,
          latitude: -33.8688,
          longitude: 151.2060,
        ),
        GoogleOffice(
          id: 'google-toronto',
          name: 'Google Toronto',
          city: 'Toronto',
          country: 'Kanada',
          region: OfficeRegion.americas,
          address: '111 Richmond Street West, Toronto, ON',
          imageUrl:
              'https://images.unsplash.com/photo-1517090504586-fde19ea6066f?w=900&auto=format&fit=crop&q=80',
          description:
              'Kantor Google di pusat kota Toronto, dekat dengan kawasan bisnis dan teknologi.',
          phoneNumber: null,
          latitude: 43.6532,
          longitude: -79.3832,
        ),
        GoogleOffice(
          id: 'google-zurich',
          name: 'Google Zurich',
          city: 'Zurich',
          country: 'Swiss',
          region: OfficeRegion.europe,
          address: 'Brandschenkestrasse 110, 8002 Zurich',
          imageUrl:
              'https://images.unsplash.com/photo-1515488764276-beab7607c1e6?w=900&auto=format&fit=crop&q=80',
          description:
              'Kantor Google di Zurich yang menjadi salah satu pusat teknik perusahaan di Eropa.',
          phoneNumber: null,
          latitude: 47.3656,
          longitude: 8.5241,
        ),
        GoogleOffice(
          id: 'google-tokyo',
          name: 'Google Tokyo',
          city: 'Tokyo',
          country: 'Jepang',
          region: OfficeRegion.asiaPacific,
          address: 'Shibuya Stream, 3-21-3 Shibuya, Tokyo',
          imageUrl:
              'https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?w=900&auto=format&fit=crop&q=80',
          description:
              'Kantor Google di Shibuya yang mendukung pengguna dan mitra di Jepang.',
          phoneNumber: null,
          latitude: 35.6580,
          longitude: 139.7022,
        ),
        GoogleOffice(
          id: 'google-bangalore',
          name: 'Google Bangalore',
          city: 'Bangalore',
          country: 'India',
          region: OfficeRegion.asiaPacific,
          address: 'No. 3, RMZ Infinity, Old Madras Road, Bangalore',
          imageUrl:
              'https://images.unsplash.com/photo-1596176530529-78163a4f7af2?w=900&auto=format&fit=crop&q=80',
          description:
              'Kantor Google di Bangalore yang menjadi bagian dari pusat teknologi di India.',
          phoneNumber: null,
          latitude: 12.9859,
          longitude: 77.6050,
        ),
      ];
}
