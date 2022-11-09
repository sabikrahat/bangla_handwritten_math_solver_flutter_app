// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigsAdapter extends TypeAdapter<Configs> {
  @override
  final int typeId = 2;

  @override
  Configs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Configs(
      isFirstLaunch: fields[0] == null ? true : fields[0] as bool?,
      theme: fields[1] == null ? Themes.light : fields[1] as Themes?,
      locale: fields[2] == null ? Locales.english : fields[2] as Locales?,
    );
  }

  @override
  void write(BinaryWriter writer, Configs obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isFirstLaunch)
      ..writeByte(1)
      ..write(obj.theme)
      ..writeByte(2)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ThemesAdapter extends TypeAdapter<Themes> {
  @override
  final int typeId = 0;

  @override
  Themes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Themes.light;
      case 1:
        return Themes.dark;
      default:
        return Themes.light;
    }
  }

  @override
  void write(BinaryWriter writer, Themes obj) {
    switch (obj) {
      case Themes.light:
        writer.writeByte(0);
        break;
      case Themes.dark:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocalesAdapter extends TypeAdapter<Locales> {
  @override
  final int typeId = 1;

  @override
  Locales read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Locales.english;
      case 1:
        return Locales.bengali;
      default:
        return Locales.english;
    }
  }

  @override
  void write(BinaryWriter writer, Locales obj) {
    switch (obj) {
      case Locales.english:
        writer.writeByte(0);
        break;
      case Locales.bengali:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
