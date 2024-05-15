<div class="space-y-6">
    
    <div>
        <x-input-label for="denominacion" :value="__('Denominacion')"/>
        <x-text-input id="denominacion" name="denominacion" type="text" class="mt-1 block w-full" :value="old('denominacion', $dclienteproveedor?->denominacion)" autocomplete="denominacion" placeholder="Denominacion"/>
        <x-input-error class="mt-2" :messages="$errors->get('denominacion')"/>
    </div>
    <div>
        <x-input-label for="tipocliente" :value="__('Tipocliente')"/>
        <x-text-input id="tipocliente" name="tipocliente" type="text" class="mt-1 block w-full" :value="old('tipocliente', $dclienteproveedor?->tipocliente)" autocomplete="tipocliente" placeholder="Tipocliente"/>
        <x-input-error class="mt-2" :messages="$errors->get('tipocliente')"/>
    </div>
    <div>
        <x-input-label for="esembarazada" :value="__('Esembarazada')"/>
        <x-text-input id="esembarazada" name="esembarazada" type="text" class="mt-1 block w-full" :value="old('esembarazada', $dclienteproveedor?->esembarazada)" autocomplete="esembarazada" placeholder="Esembarazada"/>
        <x-input-error class="mt-2" :messages="$errors->get('esembarazada')"/>
    </div>
    <div>
        <x-input-label for="carnetidentidad" :value="__('Carnetidentidad')"/>
        <x-text-input id="carnetidentidad" name="carnetidentidad" type="text" class="mt-1 block w-full" :value="old('carnetidentidad', $dclienteproveedor?->carnetidentidad)" autocomplete="carnetidentidad" placeholder="Carnetidentidad"/>
        <x-input-error class="mt-2" :messages="$errors->get('carnetidentidad')"/>
    </div>
    <div>
        <x-input-label for="activo" :value="__('Activo')"/>
        <x-text-input id="activo" name="activo" type="text" class="mt-1 block w-full" :value="old('activo', $dclienteproveedor?->activo)" autocomplete="activo" placeholder="Activo"/>
        <x-input-error class="mt-2" :messages="$errors->get('activo')"/>
    </div>

    <div class="flex items-center gap-4">
        <x-primary-button>Submit</x-primary-button>
    </div>
</div>