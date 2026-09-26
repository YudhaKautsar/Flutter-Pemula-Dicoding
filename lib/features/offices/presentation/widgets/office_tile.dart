import 'package:flutter/material.dart';

import '../../domain/entities/google_office.dart';
import 'image_fallback.dart';

class OfficeTile extends StatelessWidget {
  const OfficeTile({
    super.key,
    required this.office,
    required this.onTap,
  });

  final GoogleOffice office;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 124,
          child: Row(
            children: [
              SizedBox(
                width: 112,
                height: 124,
                child: Image.network(
                  office.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const ImageFallback(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        office.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        office.address,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.place_outlined,
                              size: 15, color: Color(0xFF287A65)),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              office.region,
                              style: const TextStyle(
                                color: Color(0xFF287A65),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios,
                              size: 13, color: Color(0xFF74797D)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}