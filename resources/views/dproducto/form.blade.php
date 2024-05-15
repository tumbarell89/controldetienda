<div class="space-y-6">
    
    <div>
        <x-input-label for="denominacion" :value="__('Denominacion')"/>
        <x-text-input id="denominacion" name="denominacion" type="text" class="mt-1 block w-full" :value="old('denominacion', $dproducto?->denominacion)" autocomplete="denominacion" placeholder="Denominacion"/>
        <x-input-error class="mt-2" :messages="$errors->get('denominacion')"/>
    </div>
    <div>
        <x-input-label for="preciocosto" :value="__('Preciocosto')"/>
        <x-text-input id="preciocosto" name="preciocosto" type="text" class="mt-1 block w-full" :value="old('preciocosto', $dproducto?->preciocosto)" autocomplete="preciocosto" placeholder="Preciocosto"/>
        <x-input-error class="mt-2" :messages="$errors->get('preciocosto')"/>
    </div>
    <div>
        <x-input-label for="codigocup" :value="__('Codigocup')"/>
        <x-text-input id="codigocup" name="codigocup" type="text" class="mt-1 block w-full" :value="old('codigocup', $dproducto?->codigocup)" autocomplete="codigocup" placeholder="Codigocup"/>
        <x-input-error class="mt-2" :messages="$errors->get('codigocup')"/>
    </div>
    <div>
        <x-input-label for="codigoproducto" :value="__('Codigoproducto')"/>
        <x-text-input id="codigoproducto" name="codigoproducto" type="text" class="mt-1 block w-full" :value="old('codigoproducto', $dproducto?->codigoproducto)" autocomplete="codigoproducto" placeholder="Codigoproducto"/>
        <x-input-error class="mt-2" :messages="$errors->get('codigoproducto')"/>
    </div>
    <div>
        <x-input-label for="unidadmedida" :value="__('Unidadmedida')"/>
        <x-text-input id="unidadmedida" name="unidadmedida" type="text" class="mt-1 block w-full" :value="old('unidadmedida', $dproducto?->unidadmedida)" autocomplete="unidadmedida" placeholder="Unidadmedida"/>
        <x-input-error class="mt-2" :messages="$errors->get('unidadmedida')"/>
    </div>
    <div>
        <x-input-label for="dtipogiros_id" :value="__('Dtipogiros Id')"/>
        <x-text-input id="dtipogiros_id" name="dtipogiros_id" type="text" class="mt-1 block w-full" :value="old('dtipogiros_id', $dproducto?->dtipogiros_id)" autocomplete="dtipogiros_id" placeholder="Dtipogiros Id"/>
        <x-input-error class="mt-2" :messages="$errors->get('dtipogiros_id')"/>
    </div>

    <div class="flex items-center gap-4">
        <x-primary-button>Submit</x-primary-button>
    </div>
</div>